import scanner
from IR_List import *
import lab1
import sys
import math
import cProfile, pstats
from io import StringIO



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
    """
    
        is_rematerializable: list of loadI nodes that are rematerializable 
    """
    def __init__(self):
        # Get IR
        self.Lab_1 = lab1.Lab1()  # init

        self.Lab_1.main(True, False)

        self.IR_LIST = self.Lab_1.ir_list
        # self.IR_LIST.print_table(self.IR_LIST)

        self.max_sr_num = self.Lab_1.max_reg
        self.num_srs_filled = self.Lab_1.num_srs

        self.VR_name = 0    # renaming
        self.SR_to_VR = []  # renaming
        self.LU = []    # renaming


        # ALLOCATION STUFF
        self.max_vr_num = 0
        self.k = 0
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

        self.is_rematerializable = []   # add loadIs from renaming, kinda redundant but dont move bc when stopped using the cc5 cycles went up a lot
        self.remat_VRs = {} # map of just the vr of the rematerializable vrs (loadi defined) to the constant of the loadi
        self.remat_spilled = [] # stores the spilled rematerializable vrs for restoring
    

    """
    
    """
    def allocate_use(self, op_num, node, line_num):
        # self.IR_LIST.print_full_line(node)

        if op_num == 1: # store, called when opcode is load, an arithop, or a store in dif_alloc
            operand_i = node.arg1
        if op_num == 2: # loadi, called when opcode is an arithop in dif_alloc
            operand_i = node.arg2
        if op_num == 3: # add, called when opcode is store in dif_alloc
            operand_i = node.arg3
        
        virt_reg = operand_i.vr

        # not spilled, get pr
        # virt reg comes from node, which comes from head in while loop in dif_alloc
        if (virt_reg not in self.is_spilled):   # virtual register of cur operation not spilled
            phys_reg = self.VRToPR[virt_reg]
            operand_i.pr = phys_reg
            self.PRNU[phys_reg] = operand_i.nu
        # spilled, restore
        else:
            phys_reg = self.handle_restore(op_num, node)
            self.is_spilled.remove(virt_reg)
        return phys_reg
    
    def free_use(self, op_num, node):
        if op_num == 1:
            operand_i = node.arg1
        if op_num == 2:
            operand_i = node.arg2
        if op_num == 3:
            operand_i = node.arg3
        
        old_phys_reg = operand_i.pr

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
        if op_num == 1:
            operand_i = node.arg1
        if op_num == 2:
            operand_i = node.arg2
        if op_num == 3:
            operand_i = node.arg3
        
        
        virt_reg = operand_i.vr

        # get new pr to hold restored vr
        if (len(self.PRStack) > 0):
            phys_reg = self.PRStack.pop()
        else:
            phys_reg = self.handle_spill(node)
   
        # what kind of restore we gonna do
        if (virt_reg in self.remat_spilled):    # just restore the loadi
            # create and add load immediate instruction
            loadi_node = Node()
            loadi_node.opcode = 2
            loadi_node.arg1.sr = self.VRToSpillLoc[virt_reg]
            loadi_node.arg3.pr = phys_reg
            self.IR_LIST.insert_before(loadi_node, node)
            self.remat_spilled.remove(virt_reg)
        else:
            # create and add loadI
            loadi_node = Node()
            loadi_node.opcode = 2
            loadi_node.arg1.sr = self.VRToSpillLoc[virt_reg]
            loadi_node.arg3.pr = phys_reg
            self.IR_LIST.insert_before(loadi_node, node)
            # create and add load
            load_node = Node()
            load_node.opcode = 0
            load_node.arg1.pr = phys_reg
            load_node.arg3.vr = virt_reg
            load_node.arg3.pr = phys_reg
            self.IR_LIST.insert_before(load_node, node)

        # update maps
        self.VRToPR[virt_reg] = phys_reg
        self.PRToVR[phys_reg] = virt_reg
        self.PRNU[phys_reg] = operand_i.nu
        operand_i.pr = phys_reg

        return phys_reg
    
    def handle_spill(self, node):
        # TODO: check that register has a next use
        
        pr_freed = max(self.PRNU, key=self.PRNU.get)
        if (pr_freed == self.pr_used_in_cur_op):
            prnu_copy = self.PRNU.copy()
            prnu_copy.pop(pr_freed)
            pr_freed = max(prnu_copy, key=prnu_copy.get)
        
        vr_to_spill = self.PRToVR[pr_freed]
        self.VRToPR[vr_to_spill] = None
        
        # dont spill twice
        if (vr_to_spill in self.is_spilled):
            return pr_freed
        
        if (vr_to_spill in self.remat_VRs):
            self.remat_spilled.append(vr_to_spill)
            self.VRToSpillLoc[vr_to_spill] = self.remat_VRs[vr_to_spill]    # spill location (the loadi constant) is this loadI's constant, so dont need to increment
        else:
            # create and add loadI- put spill location addy into reserved reg; Q: should I still update spil location?
            loadi_node = Node()
            loadi_node.opcode = 2
            loadi_node.arg1.sr = self.spill_loc
            loadi_node.arg3.pr = self.reserved_reg
            self.IR_LIST.insert_before(loadi_node, node)
            # create and add store- move spilled value from spill location into its new PR
            store_node = Node()
            store_node.opcode = 1
            store_node.arg1.vr = vr_to_spill
            store_node.arg1.pr = pr_freed
            store_node.arg3.pr = self.reserved_reg
            self.IR_LIST.insert_before(store_node, node)
            # update spill location
            self.VRToSpillLoc[vr_to_spill] = self.spill_loc
            self.spill_loc += 4

        # add to spilled array whether remat or not
        self.is_spilled.append(vr_to_spill)


        return pr_freed
    
    def print_allocated_file(self):
        """
        Prints allocated file in human readable format
        """

        node = self.IR_LIST.head


        while (node != None):
            # load or store
            if (node.opcode == LOAD_OP or node.opcode == STORE_OP):
                # temp = self.opcodes_list[node.opcode] + "  r" + str(node.arg1.pr) + "  =>   r" + str(node.arg3.pr) + "\n"
                # ret += temp
                print(f"{self.opcodes_list[node.opcode] : <7} r{node.arg1.pr}  =>   r{node.arg3.pr}")
            # loadI
            elif (node.opcode == LOADI_OP):
                # temp = self.opcodes_list[node.opcode] + "  " + str(node.arg1.sr) + "  =>   r" + str(node.arg3.pr) + "\n"
                # ret += temp
                print(f"{self.opcodes_list[node.opcode] : <7} {node.arg1.sr}  =>   r{node.arg3.pr}")
            # arithop
            elif (node.opcode >= ADD_OP and node.opcode <= RSHIFT_OP):
                # temp = self.opcodes_list[node.opcode] + "  r" + str(node.arg1.pr) + ", r" + str(node.arg2.pr) + "  =>   r" + str(node.arg3.pr) + "\n"
                # ret += temp
                print(f"{self.opcodes_list[node.opcode] : <7} r{node.arg1.pr}, r{node.arg2.pr}  =>   r{node.arg3.pr}")
            # output
            elif (node.opcode == OUTPUT_OP):
                # temp = self.opcodes_list[node.opcode] + "  " + str(node.arg1.sr) + "\n"
                # ret += temp
                print(f"{self.opcodes_list[node.opcode] : <7} {node.arg1.sr}")
            # nop- WONT HAPPEN BC OF MY RENAME BUT JUST IN CASE
            elif (node.opcode == NOP_OP):
                # temp = self.opcodes_list[node.opcode] + "\n"
                # ret += temp
                print(f"{self.opcodes_list[node.opcode] : <7}")
            
            node = node.next
    
    def dif_alloc(self, k):

        # -----------initialization-----------
        self.max_vr_num = self.get_max_vr()
        self.k = k
        self.VRToPR = {i: None for i in range(self.max_vr_num + 1)}
        self.PRToVR = {i: None for i in range(self.k - 1)}  # keep it as normal k
        self.VRToSpillLoc = {}
        self.PRNU = {i: INF for i in range(self.k - 1)}
        self.PRStack = []
        for i in range(0, self.k - 1):
            self.PRStack.append(i)
        self.PRStack.reverse()
        self.reserved_reg = self.k - 1
        if (self.max_live > self.k):
            self.k = self.k - 1
            self.reserved_reg = self.k
        # get remat VRs
        for x in self.is_rematerializable:
            # self.remat_VRs.append(x.arg3.vr)
            self.remat_VRs[x.arg3.vr] = x.arg1.sr

        # -----------end initialization-----------


        head = self.IR_LIST.head
        line_num = 1

        while (head != None and self.stop_running != True):
            # self.print_allocated_line(head)
            # self.IR_LIST.print_full_line(head)


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

                # TODO: possibly add to remat_vrs here instead of from renaming?

                # TODO: possibly free 3 here?
            

            # error = self.check_maps(head)
            # if (error == -1):
            #     print("error: " + str(error))

            # self.check_remat(head)

            # iterate
            head = head.next
            line_num += 1

    
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

        print("IS REMATERIALIZABLE:")
        for x in self.is_rematerializable:
            self.IR_LIST.print_full_line(x)
        print("REMAT VRS:")
        print(self.remat_VRs)



        print("VR TO PR:")  # vr is th index, pr is the value
        print(self.VRToPR)
        print("PR STACK:")
        print(self.PRStack)
        # head = self.IR_LIST.head
        # for each pr, p, if vrtopr[prtovr[p]] = p
        
        # for each vr, v, if vrtopr[v] is defined, prtovr[vrtopr[v]] = v
        print("PR TO VR:")  # pr is the index, vr is the value
        print(self.PRToVR)
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
    
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈rename🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈
    #🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈🏳️‍🌈

    def rename(self):

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

        # self.IR_LIST.print_table(self.IR_LIST)

    

        
        
    



  
   


def main():
    pr = cProfile.Profile()
    pr.enable() 
    lab2 = Lab2()
    # TODO: -h flag

    lab2.rename()
    if (sys.argv[1] == '-x'):
        lab2.print_renamed_block()
    elif (int(sys.argv[1]) >= 3 and int(sys.argv[1]) <= 64):
        # lab2.allocate(int(sys.argv[1]))
        lab2.dif_alloc(int(sys.argv[1]))
        lab2.print_allocated_file()
        # lab2.IR_LIST.print_table(lab2.IR_LIST)
    pr.disable()
    s = StringIO()
    sortby = 'cumulative'
    ps = pstats.Stats(pr, stream=s).sort_stats(sortby)
    ps.print_stats()
    sys.stdout.write(s.getvalue())



if __name__ == "__main__":
  main()
