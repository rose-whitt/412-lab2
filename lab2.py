import scanner
from IR_List import *
import lab1
import sys
import math




CATEGORIES = ["MEMOP", "LOADI", "ARITHOP", "OUTPUT", "NOP", "CONST", "REG", "COMMA", "INTO", "ENDFILE", "NEWLINE"]
# only want to process opcodes with registers, which is index 0 through 7
opcodes_list = ["load", "store", "loadI", "add", "sub", "mult", "lshift", "rshift", "output", "nop"]

LOAD_OP = 0
STORE_OP = 1
LOADI_OP = 2
ADD_OP = 3
SUB_OP = 4
MULT_OP = 5
LSHIFT_OP = 6
RSHIFT_OP = 7
OUTPUT_OP = 8
NOP_OP = 9

# MACROS
INVALID = -1
INF = math.inf

MEMOP = 0   # load, store
LOADI = 1   # loadI
ARITHOP = 2 # add, sub, mult, lshift, rshift
OUTPUT = 3  # output, prints MEM(x) to stdout
NOP = 4     # nop, idle for one second
CONSTANT = 5    # a non-negative integer
REGISTER = 6    # 'r' followed by a constant
COMMA = 7   # ','
INTO = 8    # "=>"
EOF = 9     # input has been exhausted
EOL = 10    # end of current line ("\r\n" or "\n")
BLANK = 11     # not an opcode, but used to signal blank space or tab
SCANNER_ERROR = 12

class Lab2:
    def __init__(self):
        # Get IR
        self.Lab_1 = lab1.Lab1()  # init
        print("//done with lab 1 init")

        self.Lab_1.main(True, False)
        print("//done with lab 1 main")

        self.IR_LIST = self.Lab_1.ir_list
        self.IR_LIST.print_table(self.IR_LIST)
        # self.IR_LIST.print_list()

        self.max_sr_num = self.Lab_1.max_reg
        print("//max reg num: " + str(self.max_sr_num))
        self.num_srs_filled = self.Lab_1.num_srs
        print("//num srs filled: " + str(self.num_srs_filled))

        self.VR_name = 0
        self.SR_to_VR = []
        self.LU = []


        # ALLOCATION STUFF
        self.max_vr_num = 0
        self.k = 0
        # print("max vr num: " + str(self.max_vr_num))
        # Allocator maps
        self.VRToPR = {}    # vr is the index, pr is the value
        
        self.PRToVR = {}    # pr is the index, vr is the value
        self.VRToSpillLoc = {}
        self.PRNU = {}

        self.PRStack = [] # for spilling- (push and pop in algo)
        # self.PRMark = {}  # make sure you're not reusing a pr in the current line
        self.pr_used_in_cur_op = -1
        self.is_spilled = []
        self.spill_loc = 32768  # and higher reserved for allocator
        self.reserved_reg = -1
        self.max_live = 0
        self.count_live = 0

        self.opcodes_list = ["load", "store", "loadI", "add", "sub", "mult", "lshift", "rshift", "output", "nop"]

        self.stop_running = False

        self.is_rematerializable = []   # add loadIs from renaming
        self.was_remat = [] # add loadIs when removed from  is_rematerializable
        self.first_use = [] # debugging array to add op when its vr is the first use, therefore where id need to add its loadI

        print("//done with lab 2 init")
    

    """
    
    """
    def allocate_use(self, op_num, node, line_num):
        print("//allocate use")
        self.IR_LIST.print_full_line(node)

        if op_num == 1: # store, called when opcode is load, an arithop, or a store in dif_alloc
            operand_i = node.arg1
        if op_num == 2: # loadi, called when opcode is an arithop in dif_alloc
            operand_i = node.arg2
        if op_num == 3: # add, called when opcode is store in dif_alloc
            operand_i = node.arg3
        
        virt_reg = operand_i.vr

        # check rematerialization
        opcode = node.opcode
        if (opcode == STORE_OP):   
            for x in self.is_rematerializable:    # allocate_use allocates the arg1 PR for store
                if (node.arg3.vr == x.arg3.vr):
                    print("CUNT")
                    if (node.arg3.vr == x.arg3.vr and (node.arg1.pr == None or node.arg1.pr == -1)):
                        print("[ALLOCATE_USE] (line " + str(node.line) + ": " + str(self.opcodes_list[node.opcode]) + ") may be declared in a loadI")
                        self.first_use.append(node)
        if (opcode >= ADD_OP and opcode<= RSHIFT_OP):   # ARITHOP
            for x in self.is_rematerializable:   # allocate_use allocates the arg1, arg2, and arg3 PRs
                if ((node.arg1.vr == x.arg3.vr or node.arg2.vr == x.arg3.vr)):
                    print("BITCH")
                    if ((node.arg1.vr == x.arg3.vr or node.arg2.vr == x.arg3.vr) and (node.arg1.pr == None or node.arg1.pr == -1) and (node.arg2.pr == None or node.arg2.pr == -1) and (node.arg3.pr == None or node.arg3.pr == -1)):
                        which_arg = -1
                        if (node.arg1.vr == x.arg3.vr):
                            which_arg = 1
                        else:
                            which_arg = 2
                        print("[ALLOCATE_USE] (line " + str(node.line) + ": " + str(self.opcodes_list[node.opcode]) + ", arg" + str(which_arg) + ") may be declared in a loadI")
                        self.first_use.append(node)
                        break
        if (opcode == LOAD_OP):
            for x in self.is_rematerializable: # allocate_use allocates the arg1 and arg3 PRs
                if ((node.arg1.vr == x.arg3.vr)):
                    print("PUSSY")
                    if ((node.arg1.vr == x.arg3.vr) and (node.arg1.pr == None or node.arg1.pr == -1) and (node.arg3.pr == None or node.arg3.pr == -1)):
                        print("[ALLOCATE_USE] (line " + str(node.line) + ": " + str(self.opcodes_list[node.opcode]) + ") may be declared in a loadI")
                        self.first_use.append(node)


        

        


        # not spilled, get pr
        # virt reg comes from node which comes from head in while loop in dif_alloc
        if (virt_reg not in self.is_spilled):
            phys_reg = self.VRToPR[virt_reg]
            operand_i.pr = phys_reg
            self.PRNU[phys_reg] = operand_i.nu
        # spilled, restore
        else:
            phys_reg = self.handle_restore(op_num, node)
            self.is_spilled.remove(virt_reg)
        return phys_reg
    
    def free_use(self, op_num, node):
        # print("//free use")

        if op_num == 1:
            operand_i = node.arg1
        if op_num == 2:
            operand_i = node.arg2
        if op_num == 3:
            operand_i = node.arg3
        
        old_phys_reg = operand_i.pr
        # print("old phys reg: " + str(old_phys_reg))

        # check if able to free
        if (operand_i.nu == INF):
            self.PRStack.append(old_phys_reg)
            # free pr in maps
            old_virt_reg = self.PRToVR[old_phys_reg]
            self.PRToVR[old_phys_reg] = None
            self.VRToPR[old_virt_reg] = None


    """
        Called in allocate_use if value of node has been spilled

    """
    def handle_restore(self, op_num, node):
        # print("// " + str(node.line) + " [HANDLE_RESTORE]: " + self.opcodes_list[node.opcode])
        # self.IR_LIST.print_full_line(node)
        if op_num == 1:
            operand_i = node.arg1
        if op_num == 2:
            operand_i = node.arg2
        if op_num == 3:
            operand_i = node.arg3
        
        # check if node's vr rematerialization
        mark_remat = False
        orig_loadi = Node() # node to hold original loadI of vr
        opcode = node.opcode
        if (opcode == STORE_OP):   
            for x in self.is_rematerializable:    # allocate_use allocates the arg1 PR for store
                if (node.arg3.vr == x.arg3.vr):
                    print("//CUNT--")
                    if (node.arg3.vr == x.arg3.vr):
                        print("//✅[RESTORE] node (" + str(node.line) + ": " + str(self.opcodes_list[node.opcode]) + ") is rematerializable!")
                        mark_remat = True
                        orig_loadi = x
                        break

        if (opcode >= ADD_OP and opcode<= RSHIFT_OP):   # ARITHOP
            for x in self.is_rematerializable:   # allocate_use allocates the arg1, arg2, and arg3 PRs
                if ((node.arg1.vr == x.arg3.vr or node.arg2.vr == x.arg3.vr)):
                    print("//BITCH--")
                    if ((node.arg1.vr == x.arg3.vr or node.arg2.vr == x.arg3.vr)):
                        which_arg = -1
                        if (node.arg1.vr == x.arg3.vr):
                            which_arg = 1
                        else:
                            which_arg = 2
                        print("//✅[RESTORE] node (" + str(node.line) + ": " + str(self.opcodes_list[node.opcode]) + ", arg" + str(which_arg) + ") is rematerializable!")
                        mark_remat = True
                        orig_loadi = x
                        break
        if (opcode == LOAD_OP):
            for x in self.is_rematerializable: # allocate_use allocates the arg1 and arg3 PRs
                if ((node.arg1.vr == x.arg3.vr)):
                    print("//PUSSY--")
                    if ((node.arg1.vr == x.arg3.vr)):
                        print("//✅[RESTORE] node (" + str(node.line) + ": " + str(self.opcodes_list[node.opcode]) + ") is rematerializable!")
                        mark_remat = True
                        orig_loadi = x
                        break

        
        virt_reg = operand_i.vr
        print("//[RESTORE] restoring vr: " + str(virt_reg))

        # get new pr to hold restored vr
        if (len(self.PRStack) > 0):
            phys_reg = self.PRStack.pop()
        else:
            print("//[RESTORE] HANDLING SPILL CUZ STACK EMPTY")
            phys_reg = self.handle_spill(node)
        
        if (mark_remat):
            print("//[RESTORE] adding original loadI cuz vr is rematerializable! orig loadi is:")
            self.IR_LIST.print_full_line(orig_loadi)
            self.IR_LIST.insert_before(orig_loadi, node)    # insert orig loadI before node
        else:
            # create and add loadI
            loadi_node = Node()
            loadi_node.opcode = 2
            loadi_node.arg1.sr = self.VRToSpillLoc[virt_reg]
            loadi_node.arg3.pr = phys_reg
            self.IR_LIST.insert_before(loadi_node, node)
            # self.IR_LIST.print_full_line(loadi_node)


            # create and add load
            load_node = Node()
            load_node.opcode = 0
            load_node.arg1.pr = phys_reg
            load_node.arg3.vr = virt_reg
            load_node.arg3.pr = phys_reg
            self.IR_LIST.insert_before(load_node, node)
            # self.IR_LIST.print_full_line(load_node)


        # update maps
        self.VRToPR[virt_reg] = phys_reg
        self.PRToVR[phys_reg] = virt_reg
        self.PRNU[phys_reg] = operand_i.nu
        operand_i.pr = phys_reg

        return phys_reg
    
    def handle_spill(self, node):
        # print("// " + str(node.line) + " [HANDLE_SPILL]: " + self.opcodes_list[node.opcode])
        # self.IR_LIST.print_full_line(node)
        # print("PRNU: ")
        # print(self.PRNU)
        # TODO: check that register has a next use
        # check if node's vr rematerialization
        mark_remat = False
        opcode = node.opcode
        if (opcode == STORE_OP):   
            for x in self.is_rematerializable:    # allocate_use allocates the arg1 PR for store
                if (node.arg3.vr == x.arg3.vr):
                    print("--CUNT--")
                    if (node.arg3.vr == x.arg3.vr):
                        print("✅[SPILL] node (" + str(node.line) + ": " + str(self.opcodes_list[node.opcode]) + ") is rematerializable!")
                        mark_remat = True
                        break

        if (opcode >= ADD_OP and opcode<= RSHIFT_OP):   # ARITHOP
            for x in self.is_rematerializable:   # allocate_use allocates the arg1, arg2, and arg3 PRs
                if ((node.arg1.vr == x.arg3.vr or node.arg2.vr == x.arg3.vr)):
                    print("--BITCH--")
                    if ((node.arg1.vr == x.arg3.vr or node.arg2.vr == x.arg3.vr)):
                        which_arg = -1
                        if (node.arg1.vr == x.arg3.vr):
                            which_arg = 1
                        else:
                            which_arg = 2
                        print("✅[SPILL] node (" + str(node.line) + ": " + str(self.opcodes_list[node.opcode]) + ", arg" + str(which_arg) + ") is rematerializable!")
                        mark_remat = True
                        break
        if (opcode == LOAD_OP):
            for x in self.is_rematerializable: # allocate_use allocates the arg1 and arg3 PRs
                if ((node.arg1.vr == x.arg3.vr)):
                    print("--PUSSY--")
                    if ((node.arg1.vr == x.arg3.vr)):
                        print("✅[SPILL] node (" + str(node.line) + ": " + str(self.opcodes_list[node.opcode]) + ") is rematerializable!")
                        mark_remat = True
                        break

        

        
        pr_freed = max(self.PRNU, key=self.PRNU.get)
        if (pr_freed == self.pr_used_in_cur_op):
            print("//[SPILL] pr_freed == self.pr_used_in_cur_op")
            prnu_copy = self.PRNU.copy()
            prnu_copy.pop(pr_freed)
            pr_freed = max(prnu_copy, key=prnu_copy.get)
        
        # print("//pr freed: " + str(pr_freed))
        vr_to_spill = self.PRToVR[pr_freed]
        # print("//vr to spill: " + str(vr_to_spill))

        self.VRToPR[vr_to_spill] = None
        print("[SPILL] VR: " + str(vr_to_spill))

        # "To spill a rematerializable value, the allocator just frees the register. It does not need to insert code to spill"
        if (mark_remat):
            print("[SPILL] VR, " + str(vr_to_spill) + ", is rematerializable! Not adding loadI and store!")
        else:
            # create and add loadI- put spill location addy into reserved reg; Q: should I still update spil location?
            loadi_node = Node()
            loadi_node.opcode = 2
            loadi_node.arg1.sr = self.spill_loc
            loadi_node.arg3.pr = self.reserved_reg
            # print('[HANDLE SPILL] RESERVED REG: ' + str(self.reserved_reg))
            # print('[HANDLE SPILL]loadi_node.arg3.pr: ' + str(loadi_node.arg3.pr))

            self.IR_LIST.insert_before(loadi_node, node)
            # self.IR_LIST.print_full_line(loadi_node)

            # self.IR_LIST.print_table(self.IR_LIST)

            # create and add store- move spilled value from spill location into its new PR
            store_node = Node()
            store_node.opcode = 1
            store_node.arg1.vr = vr_to_spill
            store_node.arg1.pr = pr_freed
            store_node.arg3.pr = self.reserved_reg
            self.IR_LIST.insert_before(store_node, node)
            # self.IR_LIST.print_full_line(store_node)

            # self.IR_LIST.print_table(self.IR_LIST)


        # update spill location
        self.VRToSpillLoc[vr_to_spill] = self.spill_loc
        self.spill_loc += 4

        # add to spilled array
        self.is_spilled.append(vr_to_spill)

        # self.stop_running = True

        return pr_freed
    
    def print_allocated_file(self):
        """
        Prints allocated file in human readable format
        """

        node = self.IR_LIST.head

        while (node != None):
            # load or store
            if (node.opcode == 0 or node.opcode == 1):
                print(f"{self.opcodes_list[node.opcode] : <7} r{node.arg1.pr}  =>   r{node.arg3.pr}")
            # loadI
            elif (node.opcode == 2):
                print(f"{self.opcodes_list[node.opcode] : <7} {node.arg1.sr}  =>   r{node.arg3.pr}")
            # arithop
            elif (node.opcode >= 3 and node.opcode <= 7):
                print(f"{self.opcodes_list[node.opcode] : <7} r{node.arg1.pr}, r{node.arg2.pr}  =>   r{node.arg3.pr}")
            # output
            elif (node.opcode == 8):
                print(f"{self.opcodes_list[node.opcode] : <7} {node.arg1.sr}")
            # nop
            elif (node.opcode == 9):
                print(f"{self.opcodes_list[node.opcode] : <7}")
            
            node = node.next
    
    def dif_alloc(self, k):
        print("//START OF DIF_ALLOC")

        # -----------initialization-----------
        self.max_vr_num = self.get_max_vr()
        print("//MAX VR NUM: " + str(self.max_vr_num))
        self.k = k
        print("//k: " + str(self.k))
        self.VRToPR = {i: None for i in range(self.max_vr_num + 1)}
        self.PRToVR = {i: None for i in range(self.k - 1)}  # keep it as normal k
        # print("//PR TO VR")
        # print(self.PRToVR)
        self.VRToSpillLoc = {}
        self.PRNU = {i: INF for i in range(self.k - 1)}
        # print("// PRNU")
        # print(self.PRNU)
        # self.PRStack = list(range(self.k - 1, -1, -1))
        self.PRStack = []
        for i in range(0, self.k - 1):
            self.PRStack.append(i)
        self.PRStack.reverse()
        print("// LEN OF PRSTACK: " + str(len(self.PRStack)))
        print("// PRSTACK: " + str(self.PRStack))

        print("// MAX LIVE: " + str(self.max_live))
        self.reserved_reg = self.k - 1
        if (self.max_live > self.k):
            self.k = self.k - 1
            self.reserved_reg = self.k
        print("// RESERVED REG: " + str(self.reserved_reg))
        print("// k after: " + str(self.k))
        # -----------end initialization-----------


        head = self.IR_LIST.head
        line_num = 1

        while (head != None and self.stop_running != True):
            if (head in self.is_rematerializable):
                print("✅[DIF_ALLOC] node (" + str(head.line) + ": " + str(self.opcodes_list[head.opcode]) + ") is rematerializable!")
                # self.print_allocated_line(head)
                # self.IR_LIST.print_full_line(head)
                # head = head.next
                # line_num += 1
                # continue
            self.print_allocated_line(head)
            self.IR_LIST.print_full_line(head)

            # if (head.opcode == STORE_OP):   
            #     for x in self.is_rematerializable:    # allocate_use allocates the arg1 PR for store
            #         if (head.arg3.vr == x.arg3.vr):
            #             print("CUNT")
            #             if (head.arg3.vr == x.arg3.vr and (head.arg1.pr == None or head.arg1.pr == -1)):
            #                 print("[ALLOCATE_USE] (line " + str(head.line) + ": " + str(self.opcodes_list[head.opcode]) + ") may be declared in a loadI")
            #                 self.first_use.append(head)
            # if (head.opcode >= ADD_OP and head.opcode <= RSHIFT_OP):   # ARITHOP
            #     for x in self.is_rematerializable:   # allocate_use allocates the arg1, arg2, and arg3 PRs
            #         if ((head.arg1.vr == x.arg3.vr or head.arg2.vr == x.arg3.vr)):
            #             print("BITCH")
            #             if ((head.arg1.vr == x.arg3.vr or head.arg2.vr == x.arg3.vr) and (head.arg1.pr == None or head.arg1.pr == -1) and (head.arg2.pr == None or head.arg2.pr == -1) and (head.arg3.pr == None or head.arg3.pr == -1)):
            #                 which_arg = -1
            #                 if (head.arg1.vr == x.arg3.vr):
            #                     which_arg = 1
            #                 else:
            #                     which_arg = 2
            #                 print("[ALLOCATE_USE] (line " + str(head.line) + ": " + str(self.opcodes_list[head.opcode]) + ", arg" + str(which_arg) + ") may be declared in a loadI")
            #                 self.first_use.append(head)
            # if (head.opcode == LOAD_OP):
            #     for x in self.is_rematerializable: # allocate_use allocates the arg1 and arg3 PRs
            #         if ((head.arg1.vr == x.arg3.vr)):
            #             print("PUSSY")
            #             if ((head.arg1.vr == x.arg3.vr) and (head.arg1.pr == None or head.arg1.pr == -1) and (head.arg3.pr == None or head.arg3.pr == -1)):
            #                 print("[ALLOCATE_USE] (line " + str(head.line) + ": " + str(self.opcodes_list[head.opcode]) + ") may be declared in a loadI")
            #                 self.first_use.append(head)




            # ----- USES --------
            if (head.opcode == 0):  # load
                self.allocate_use(1, head, line_num)    # allocate store
                self.free_use(1, head)  # free store
            if (head.opcode >= 3 and head.opcode <= 7): # arithop
                self.pr_used_in_cur_op = self.allocate_use(1, head, line_num)   # allocate store
                self.allocate_use(2, head, line_num)    # allocate loadI
                self.pr_used_in_cur_op = -1
                self.free_use(1, head)  # free store
                self.free_use(2, head)  # free loadi
            if (head.opcode == 1):  # store
                self.pr_used_in_cur_op = self.allocate_use(1, head, line_num)   # allocate store
                self.allocate_use(3, head, line_num)    # allocate add
                self.pr_used_in_cur_op = -1
                self.free_use(1, head)  # free store
                self.free_use(3, head)  # free add
            
            # ----- DEFS --------
            if (head.arg3.sr != None and head.opcode != 1): # sr is not invalid and opcode is not a store
                virt_reg = head.arg3.vr
                # get phys reg
                if (len(self.PRStack) > 0):
                    phys_reg = self.PRStack.pop()
                else:
                    phys_reg = self.handle_spill(head)
                # update maps
                head.arg3.pr = phys_reg
                self.VRToPR[virt_reg] = phys_reg
                self.PRToVR[phys_reg] = virt_reg
                self.PRNU[phys_reg] = head.arg3.nu
            
            # error = self.check_maps(head)
            # if (error == -1):
            #     print("error: " + str(error))

            self.check_remat(head)

            # iterate
            head = head.next
            line_num += 1
        # print(self.IR_LIST.print_table(self.IR_LIST))
        # print("VRToPR [")
        # print(self.VRToPR)
        # print("]")
        # print("PRToVR [")
        # print(self.PRToVR)
        # print("]")
    
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈helpers🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈

    """
        Checks things possibly related to rematerialzaion

    """
    def check_remat(self, head):
        print(str(head.line) + ": opcode: " + self.opcodes_list[head.opcode] + "; IS_SPILLED:")
        print(self.is_spilled)
        print(str(head.line) + ": opcode: " + self.opcodes_list[head.opcode] + "; VRTOSPILLLOC:")
        print(self.VRToSpillLoc)

   
    def op_defines(self, operand):
        # print("operand: " + str(operand))
        # print("SR_to_VR len: " + str(len(self.SR_to_VR)))
        # print("[op_defines] operand.sr: " + str(operand.sr))
        if (self.SR_to_VR[operand.sr] == INVALID):  # Unused DEF
            self.SR_to_VR[operand.sr] = self.VR_name
            self.VR_name += 1
        operand.vr = self.SR_to_VR[operand.sr]
        operand.nu = self.LU[operand.sr]
        self.SR_to_VR[operand.sr] = INVALID # kill OP3
        self.LU[operand.sr] = INF
        # update maxlive counter
        self.count_live -= 1
        return operand
  
    def op_uses(self, operand):
        if (self.SR_to_VR[operand.sr] == INVALID):  # Last use
            self.SR_to_VR[operand.sr] = self.VR_name
            self.VR_name += 1
            # update maxlive counter
            self.count_live += 1
            # if (self.DEBUG):
            #     print("op_uses: " + str(self.count_live))
            if self.count_live > self.max_live:
                # if (self.DEBUG):
                #     print("op_uses: count live greater than max live. assigning count live to max live.")
                self.max_live = self.count_live
        operand.vr = self.SR_to_VR[operand.sr]
        operand.nu = self.LU[operand.sr]

    def get_max_vr(self):
        start = self.IR_LIST.head
        max = 0
        while (start != None):
            if (start.arg1.vr != None and start.arg1.vr > max):
                max = start.arg1.vr
            if (start.arg2.vr != None and start.arg2.vr > max):
                max = start.arg2.vr
            if (start.arg3.vr != None and start.arg3.vr > max):
                max = start.arg3.vr
            start = start.next
        return max


    
    def print_renamed_block(self):
        start = self.IR_LIST.head
        print("//HERE")
        while (start != None):
            # print(start)
            lh = ""
            rh = ""
            
            if (start.opcode == 0 or start.opcode == 1): # MEMOP
                lh = "r" + str(start.arg1.vr)
            elif (start.opcode == 2): # LOADI
                lh = str(start.arg1.sr)
            elif (start.opcode >= 3 and start.opcode <= 7):  # ARITHOP
                lh = "r" + str(start.arg1.vr) + ",r" + str(start.arg2.vr) 
            elif (start.opcode == 8): # OUTPUT
                lh = str(start.arg1.sr)
            
            if (start.opcode != 8):
                rh = "=> r" + str(start.arg3.vr)

            opcode = opcodes_list[start.opcode] + " "


            print(opcode + lh + " " + rh)

            start = start.next
  
    def print_allocated_line(self, node):
        # load or store
            if (node.opcode == 0 or node.opcode == 1):
                print(f"//{self.opcodes_list[node.opcode] : <7} r{node.arg1.pr}  =>   r{node.arg3.pr}")
            # loadI
            elif (node.opcode == 2):
                print(f"//{self.opcodes_list[node.opcode] : <7} {node.arg1.sr}  =>   r{node.arg3.pr}")
            # arithop
            elif (node.opcode >= 3 and node.opcode <= 7):
                print(f"//{self.opcodes_list[node.opcode] : <7} r{node.arg1.pr}, r{node.arg2.pr}  =>   r{node.arg3.pr}")
            # output
            elif (node.opcode == 8):
                print(f"//{self.opcodes_list[node.opcode] : <7} {node.arg1.sr}")
            # nop
            elif (node.opcode == 9):
                print(f"//{self.opcodes_list[node.opcode] : <7}")
        

    def check_maps(self, line):
        print("[CHECK_MAPS]")
        # self.print_renamed_block()
        # self.IR_LIST.print_table(self.IR_LIST)
        self.IR_LIST.print_full_line(line)
        # print(line)
        self.print_allocated_line(line)
        # print("PR STACK:")
        # print(self.PRStack)
        # head = self.IR_LIST.head
        # for each pr, p, if vrtopr[prtovr[p]] = p
        # print("VR TO PR:")  # vr is th index, pr is the value
        # print(self.VRToPR)
        # for each vr, v, if vrtopr[v] is defined, prtovr[vrtopr[v]] = v
        # print("PR TO VR:")  # pr is the index, vr is the value
        # print(self.PRToVR)
        # print("SPILL LOC:")
        # print(self.spill_loc)
        # print("VR TO SPILL LOC: ")
        # print(self.VRToSpillLoc)
        # print("pr_used_in_cur_op")
        # print(self.pr_used_in_cur_op)
        # print("IS SPILLED: ")
        # print(self.is_spilled)

        for key, val in self.VRToPR.items():
            if (val in self.PRToVR and self.PRToVR[val] != key):
                print(f"ERROR {line.line}: the pair ({key}, {val}) in self.VRToPR does not match the pair ({val}, {self.PRToVR[val]}) in self.PRToVR")
                return -1
        for key, val in self.PRToVR.items():
            if (val in self.VRToPR and self.VRToPR[val] != key):
                print(f"ERROR {line.line}: the pair ({key}, {val}) in self.PRToVR does not match the pair ({val}, {self.VRToPR[val]}) in self.VRToPR")
                return -1
        if (line.arg1.pr != None):
            print("ARG1 LINE " + str(line.line) + ": PR: " + str(line.arg1.pr) + " ; PRNU[PR]: " + str(self.PRNU[line.arg1.pr]))
        if (line.arg2.pr != None):
            print("ARG2 LINE " + str(line.line) + ": PR: " + str(line.arg2.pr) + " ; PRNU[PR]: " + str(self.PRNU[line.arg2.pr]))
        if (line.arg3.pr != None):
            print("ARG3 LINE " + str(line.line) + ": PR: " + str(line.arg3.pr) + " ; PRNU[PR]: " + str(self.PRNU[line.arg3.pr]))
        
        return 0
        
        VRToPR_count_correct_1 = 0
        VRToPR_count_correct_2 = 0
        VRToPR_count_correct_3 = 0
        PRToVR_count_correct_1 = 0
        PRToVR_count_correct_2 = 0
        PRToVR_count_correct_3 = 0
        # while (head != None):
            # print(head)
            # for each pr, p, if vrtopr[prtovr[p]] = p
        # if (line.arg1.pr != None and self.PRToVR.get(line.arg1.pr) != None and self.PRToVR.get(line.arg1.pr) != INF):
        #     if ((self.PRToVR[line.arg1.pr] < len(self.VRToPR)) and self.VRToPR[self.PRToVR[line.arg1.pr]] == line.arg1.pr):
        #         VRToPR_count_correct_1 += 1
        #     else:
        #         print("VRToPR ERROR! ARG1 LINE " + str(line.line) + ". EXPECTED: " + str(line.arg1.pr) + " ; ACTUAL: " + str(self.VRToPR[self.PRToVR[line.arg1.pr]]))
        # # print("ARG2 PRToVR[PR]: " + str(self.PRToVR.get(line.arg2.pr)))
        # # print("ARG2 PR: " + str(line.arg2.pr))
        # # print("VRToPR len: " + str(len(self.VRToPR)))
        # # print("PRTOVR len: " + str(len(self.PRToVR)))
        # if (line.arg2.pr != None and self.PRToVR.get(line.arg2.pr) != None and self.PRToVR.get(line.arg2.pr) != INF):
        #     if ((self.PRToVR[line.arg2.pr] < len(self.VRToPR)) and self.VRToPR[self.PRToVR[line.arg2.pr]] == line.arg2.pr):
        #         VRToPR_count_correct_2 += 1
        #     else:
        #         print("VRToPR ERROR! ARG2 LINE " + str(line.line) + ". EXPECTED: " + str(line.arg2.pr) + " ; ACTUAL: " + str(self.VRToPR[self.PRToVR[line.arg2.pr]]))
        # # print("ARG3 PRToVR[PR]: " + str(self.PRToVR.get(line.arg3.pr)))
        # # print("ARG3 PR: " + str(line.arg3.pr))
        # # print("VRToPR len: " + str(len(self.VRToPR)))
        # # print("PRTOVR len: " + str(len(self.PRToVR)))

        # if (line.arg3.pr != None and self.PRToVR.get(line.arg3.pr) != None and self.PRToVR.get(line.arg3.pr) != INF):
        #     if ((self.PRToVR[line.arg3.pr] < len(self.VRToPR)) and self.VRToPR[self.PRToVR[line.arg3.pr]] == line.arg3.pr):
        #         VRToPR_count_correct_3 += 1
        #     else:
        #         print("VRToPR ERROR! ARG3 LINE " + str(line.line) + ". EXPECTED: " + str(line.arg3.pr) + " ; ACTUAL: " + str(self.VRToPR[self.PRToVR[line.arg3.pr]]))

        # # for each vr, v, if vrtopr[v] is defined, prtovr[vrtopr[v]] = v
        # # print("ARG1 VRToPR[VR] " + self.VRToPR[head.arg1.vr])
        # if (line.arg1.vr != None and self.VRToPR.get(line.arg1.vr) != INVALID and self.VRToPR.get(line.arg1.vr) != None):
        #     if (self.PRToVR[self.VRToPR[line.arg1.vr]] == line.arg1.vr):
        #         PRToVR_count_correct_1 += 1
        #     else:
        #         print("PRToVR ERROR! ARG1 LINE " + str(line.line) + ". EXPECTED: " + str(line.arg1.vr) + " ; ACTUAL: " + str(self.PRToVR[self.VRToPR[line.arg1.vr]]))
        # # print("ARG2 VRToPR[VR] " + self.VRToPR[head.arg2.vr])
        # if (line.arg2.vr != None and self.VRToPR.get(line.arg2.vr) != INVALID and self.VRToPR.get(line.arg2.vr) != None):
        #     if (self.PRToVR[self.VRToPR[line.arg2.vr]] == line.arg2.vr):
        #         PRToVR_count_correct_2 += 1
        #     else:
        #         print("PRToVR ERROR! ARG2 LINE " + str(line.line) + ". EXPECTED: " + str(line.arg2.vr) + " ; ACTUAL: " + str(self.PRToVR[self.VRToPR[line.arg2.vr]] ))
        # # print("ARG3 VRToPR[VR]: " + str(self.VRToPR.get(line.arg3.vr)))
        # # print("ARG3 VR: " + str(line.arg3.vr))

        # if (line.arg3.vr != None and self.VRToPR.get(line.arg3.vr) != INVALID and self.VRToPR.get(line.arg3.vr) != None):
        #     # if (self.VRToPR[head.arg3.vr] != INVALID):
        #     if (self.PRToVR[self.VRToPR[line.arg3.vr]] == line.arg3.vr):
        #         PRToVR_count_correct_3 += 1
        #     else:
        #         print("PRToVR ERROR! ARG3 LINE " + str(line.line) + ". EXPECTED: " + str(line.arg3.vr) + " ; ACTUAL: " + str(self.PRToVR[self.VRToPR[line.arg3.vr]]))

        # at operation x, for each pr, p, nu[p] > x
        # if (line.arg1.pr != None):
        #     print("ARG1 LINE " + str(line.line) + ": PR: " + str(line.arg1.pr) + " ; PRNU[PR]: " + str(self.PRNU[line.arg1.pr]))
        # if (line.arg2.pr != None):
        #     print("ARG2 LINE " + str(line.line) + ": PR: " + str(line.arg2.pr) + " ; PRNU[PR]: " + str(self.PRNU[line.arg2.pr]))
        # if (line.arg3.pr != None):
        #     print("ARG3 LINE " + str(line.line) + ": PR: " + str(line.arg3.pr) + " ; PRNU[PR]: " + str(self.PRNU[line.arg3.pr]))
        
            # head = head.next
    
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈rename🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈

    def rename(self):
        print("//in rename")
        print("//num srs filled: " + str(self.num_srs_filled))


        self.SR_to_VR = [INVALID for i in range(self.max_sr_num + 1)] # register numbers start at 0 so must be plus one the max register
        self.LU = [INF for i in range(self.max_sr_num + 1)]



        index = self.IR_LIST.length - 1

        OP = self.IR_LIST.tail
        while (OP != None):  # For each OPCODE (OP) in the block, bottom to top
            # print(OP.opcode)

            # Only want opcodes with registers: MEMOP, LOADI, and ARITHOP
            # registers in each:
            # MEMOP: arg1 and arg3
            # LOADI: arg3
            # ARTIHOP: arg1, arg2, arg3
            # OUTPUT: none, constant only
            if (OP.opcode >= 0 and OP.opcode <= 7):
                #-------------
                # For each Operand (O) that OPCODE (OP) defines- third operand
                # if (OP.arg1.sr != None and OP.opcode != 2): # LOADI stores constant at first sr
                #   OP.arg1 = self.op_defines(OP.arg1)
                # if (OP.arg2.sr != None and OP.opcode != 0 and OP.opcode != 1 and OP.opcode != 2): # only ARITHOPs populate sr2
                #   OP.arg2 = self.op_defines(OP.arg2)
                if (OP.opcode == LOADI_OP):
                    self.is_rematerializable.append(OP)

                
                if (OP.arg3.sr != None and OP.opcode != 1):  # all of them populate sr3, store's arg3 is a use, so dont define
                    OP.arg3 = self.op_defines(OP.arg3)
                #-------------
                # For each Operand (O) that OPCODE (OP) uses- first and second operand
                
                if (OP.arg1.sr != None and OP.opcode != 2): # LOADI stores constant at first sr
                    self.op_uses(OP.arg1)
                    self.LU[OP.arg1.sr] = index
                if (OP.arg2.sr != None and OP.opcode != 0 and OP.opcode != 1 and OP.opcode != 2): # only ARITHOPs populate sr2
                    self.op_uses(OP.arg2)
                    self.LU[OP.arg2.sr] = index
                if (OP.arg3.sr != None and OP.opcode == 1): # third operand is a use for store
                    self.op_uses(OP.arg3)
                    self.LU[OP.arg3.sr] = index

            
            index -= 1
            OP = OP.prev

        self.IR_LIST.print_table(self.IR_LIST)

    

        
        
    



  
   


def main():
  print("//in main")
  lab2 = Lab2()
  # TODO: -h flag

  lab2.rename()
  print("//renaming done")
  if (sys.argv[1] == '-x'):
    lab2.print_renamed_block()
  elif (int(sys.argv[1]) >= 3 and int(sys.argv[1]) <= 64):
    # lab2.allocate(int(sys.argv[1]))
    lab2.dif_alloc(int(sys.argv[1]))
    print("//allocating done")
    print("// MaxLive is " + str(lab2.max_live))
    # lab2.print_renamed_block()
    # print("--------------")
    print("ALLOCATED FILE: ")
    lab2.print_allocated_file()
    print("IS SPILLED:")
    print(lab2.is_spilled)
    print("VR TO SPILL LOC:")
    print(lab2.VRToSpillLoc)
    print()
    print("ALLOCATED TABLE:")
    lab2.IR_LIST.print_table(lab2.IR_LIST)
    print()
    print("IS REMATERIALIZABLE:")
    for node in lab2.is_rematerializable:
        lab2.IR_LIST.print_full_line(node)
    print()
    print("first use:")
    for x in lab2.first_use:
        lab2.IR_LIST.print_full_line(x)



if __name__ == "__main__":
  main()
