import sys
from IR_List import *
import math


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

INVALID = -1
INF = math.inf

class Allocate:
    def __init__(self, DEBUG, ir_list, k, max_live, vr_name, max_reg, num_srs):

        self.k = k
        
        self.max_live = max_live
        print("max live: " + str(self.max_live))
        self.VR_name = vr_name
        print("vr_name: " + str(self.VR_name))
        self.IR_LIST = ir_list
        self.DEBUG = DEBUG
        if (self.DEBUG):
          self.IR_LIST.print_table(self.IR_LIST)
        # self.IR_LIST.print_list()

        self.max_sr_num = max_reg
        if (self.DEBUG):
            print("//max reg num: " + str(self.max_sr_num))
        self.num_srs_filled = num_srs
        if (self.DEBUG):
            print("//num srs filled: " + str(self.num_srs_filled))




        # ALLOCATION STUFF
        self.max_vr_num = self.max_sr_num;
        # Allocator maps
        self.VRToPR = {i: None for i in range(self.max_vr_num + 1)}
        self.PRToVR = {i: None for i in range(self.k)}
        self.VRToSpillLoc = {}
        self.PRNU = {i: INF for i in range(self.k)}

        self.PRStack = list(range(self.k - 1, -1, -1)) # stack of free registers; for spilling- (push and pop in algo)
        self.pr_used_in_cur_op = -1

        self.is_spilled = []
        self.spill_loc = 32768
        self.spill_k = -1
        if (self.max_live > self.k):
            self.k = self.k - 1
            self.spill_k = self.k

        self.opcodes_list = ["load", "store", "loadI", "add", "sub", "mult", "lshift", "rshift", "output", "nop"]

        if (self.DEBUG):
            print("//done with lab 2 init")
    

    # """
    # Allocation helper that resets the mark in each pr to zero
    # """
    # def reset_marks(self):
    #     for pr in self.PRMark.keys():
    #         self.PRMark[pr] = 0
  
    # """
    # Allocation helper that gets the uses of the given OPCODE
    # """
    # def get_uses(self, line):
    #     if (line.opcode == LOAD_OP):
    #         uses = [line.arg1]
    #         print("//[get uses] load uses: " + str(line.arg1))
            
    #         return uses
    #     elif (line.opcode == ADD_OP or line.opcode == SUB_OP or line.opcode == MULT_OP or line.opcode == LSHIFT_OP or line.opcode == RSHIFT_OP):
    #         uses = [line.arg1, line.arg2]
    #         print("//[get uses] " + opcodes_list[line.opcode] + " uses: [" + str(line.arg1) + ", " + str(line.arg2) + "]")
    #         return uses
    #     elif (line.opcode == OUTPUT_OP):
    #         uses = []
    #         print("//[get uses] output uses: " + str(uses))
    #         return uses
    #     elif (line.opcode == NOP_OP):
    #         uses = []
    #         print("//[get uses] nop uses: " + str(uses))
    #         return uses
    #     elif (line.opcode == LOADI_OP):
    #         uses = []
    #         print("//[get uses] loadI uses: " + str(uses))
    #         return uses
    #     elif (line.opcode == STORE_OP):
    #         uses = [line.arg1, line.arg3]
    #         print("//[get uses] store uses: [" + str(line.arg1) + ", " + str(line.arg3) + "]")
    #         return uses
    #     else:
    #         uses = []
    #         print("//[get uses] couldnt find opcode for opcode: " + str(line.opcode))
    #         return uses

      
    
    # """
    #     Allocation helper that gets the defs of the given OPCODE
    # """
    # def get_defs(self, line):
    #     if (line.opcode == LOAD_OP):
    #         defs = [line.arg3]
    #         print("//[get defs] load defs: [" + str(line.arg3) + "]")
            
    #         return defs
    #     elif (line.opcode == ADD_OP or line.opcode == SUB_OP or line.opcode == MULT_OP or line.opcode == LSHIFT_OP or line.opcode == RSHIFT_OP):
    #         defs = [line.arg3]
    #         print("//[get defs] " + opcodes_list[line.opcode] + " defs: [" + str(line.arg3) + "]")
    #         return defs
    #     elif (line.opcode == OUTPUT_OP):
    #         defs = []
    #         print("//[get defs] output defs: " + str(defs))
    #         return defs
    #     elif (line.opcode == NOP_OP):
    #         defs = []
    #         print("//[get defs] nop defs: " + str(defs))
    #         return defs
    #     elif (line.opcode == LOADI_OP):
    #         defs = [line.arg3]
    #         print("//[get defs] loadI defs: [" + str(line.arg3) + "]")
    #         return defs
    #     elif (line.opcode == STORE_OP):
    #         defs = []
    #         print("//[get defs] store defs: " + str(defs))
    #         return defs
    #     else:
    #         defs = []
    #         print("//[get defs] couldnt find opcode for opcode: " + str(line.opcode))
    #         return defs
    
  
    # def get_PR(self, vr, nu):
    #     print("get_pr")
    #     x = INVALID
    #     # if stack not empty, i.e. there are free registers available
    #     if (len(self.PRStack) > 0):
    #         x = self.PRStack.pop(0) # TODO: why get the first one not the last?
    #     else: # no free registers
    #         # TODO: pick an unmarked x to spill
    #         print("poo")

  
    # def restore(self, vr, pr):
    #     print("restore")

    # def free_pr(self, pr):
    #     print("free_pr")

    



  
    # """
    # Main allocation funciton. Take the IR and allocate k registers to the code.

    # Input:
    #     - k: maximum number of physical registers on this machine

    # """
    # def allocate(self):
    #     print("in allocate")
    #     vr = 0
    #     while (vr < self.max_vr_num):
    #         self.VRToPR[vr] = INVALID
    #         self.VRToSpillLoc[vr] = INVALID
    #         vr += 1
    
    #     pr = 0
    #     while (pr < self.k):
    #         self.PRToVR[pr] = INVALID
    #         self.PRNU[pr] = INF
    #         self.PRMark[pr] = 0
    #         self.PRStack.insert(0, pr)  # push(pr) in algo
    #         pr += 1
        
    #     line = self.IR_LIST.head
    #     # iterate over block
    #     while (line != None):
    #         # clear the mark in each pr
    #         self.reset_marks()
            

            
    #         print(line)
    #         defs = self.get_defs(line)
    #         uses = self.get_uses(line)

    #         # allocate uses
    #         for use in uses:
    #             pr = self.VRToPR[use.vr]
    #             print("pr: " + str(pr))
    #             if (pr == INVALID):
    #                 print("gettin a pr")
    #                 use.pr = self.get_PR(use.vr, use.nu)  # TODO: implement func
    #                 # TODO: implement restore
    #                 self.restore(use.vr, use.pr)  # TODO: implement func
    #             else:
    #                 use.pr = pr
                
    #             self.PRMark[use.pr] = 1

    #         # check if last use
    #         for use in uses:
    #             print(use)
    #             if (use.nu == INF and not self.PRToVR[use.pr] == INVALID):
    #                 self.free_PR(use.pr)  # TODO: implement func
            
    #         # clear mark in each pr
    #         self.reset_marks()

    #         # allocate defs
    #         for d in defs:
    #             d.pr = self.get_PR(d.vr, d.nu)  # TODO: implement func
    #             self.PRMark[d.pr] = 1
            
    #         print(line)
    #         self.check_maps() # TODO: implement func
            
    #         line = line.next
    

    def allocate_use(self, op_num, node, line_num):
        print("allocate use")

        if op_num == 1:
            operand_i = node.arg1
        if op_num == 2:
            operand_i = node.arg2
        if op_num == 3:
            operand_i = node.arg3
        
        virt_reg = operand_i.vr

        # not spilled, get pr
        if (virt_reg not in self.is_spilled):
            phys_reg = self.VRToPR[virt_reg]
            operand_i.pr = phys_reg
            self.PRNU[phys_reg] = operand_i.nu
        
        # spilled, restore
        else:
            phys_reg = self.handle_restore(op_num, node)
            self.is_spilled.remove(virt_reg)
        return phys_reg

    def handle_restore(self, op_num, node):
        print("handle restore")
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
        print("loadnode:")
        print(load_node)
        self.IR_LIST.insert_before(load_node, node)

        # update maps
        self.VRToPR[virt_reg] = phys_reg
        self.PRToVR[phys_reg] = virt_reg
        self.PRNU[phys_reg] = operand_i.nu
        operand_i.pr = phys_reg

        return phys_reg
    
    def handle_spill(self, node):
        print("handle spill")

        pr_freed = max(self.PRNU, key=self.PRNU.get)
        if (pr_freed == self.pr_used_in_cur_op):
            prnu_copy = self.PRNU.copy()
            prnu_copy.pop(pr_freed)
            pr_freed = max(prnu_copy, key=prnu_copy.get)
        
        vr_to_spill = self.PRToVR[pr_freed]

        self.VRToPR[vr_to_spill] = None

        # create and add loadI
        loadi_node = Node()
        loadi_node.opcode = 2
        loadi_node.arg1.sr = self.spill_loc
        loadi_node.arg3.pr = self.spill_k
        print("loadi node:")
        print(loadi_node)
        self.IR_LIST.insert_before(loadi_node, node)

        # create and add store
        store_node = Node()
        store_node.opcode = 1
        store_node.arg1.vr = vr_to_spill
        store_node.arg1.pr = pr_freed
        store_node.arg3.pr = self.spill_k
        print("store node:")
        print(store_node)
        self.IR_LIST.insert_before(store_node, node)

        # update spill location
        self.VRToSpillLoc[vr_to_spill] = self.spill_loc
        self.spill_loc += 4

        # add to spilled array
        self.is_spilled.append(vr_to_spill)

        return pr_freed

    def free_use(self, op_num, node):
        print("free use")

        if op_num == 1:
            operand_i = node.arg1
        if op_num == 2:
            operand_i = node.arg2
        if op_num == 3:
            operand_i = node.arg3
        
        old_phys_reg = operand_i.pr
        print("old phys reg: " + str(old_phys_reg))

        # check if able to free
        if (operand_i.nu == INF):
            self.PRStack.append(old_phys_reg)
            # free pr in maps
            old_virt_reg = self.PRToVR[old_phys_reg]
            self.PRToVR[old_phys_reg] = None
            self.VRToPR[old_virt_reg] = None


    
    def check_maps(self, line_num):
        print("check maps")

        for key, val in self.VRToPR.items():
            if (val in self.PRToVR and self.PRToVR[val] != key):
                print(f"ERROR {line_num}: the pair ({key}, {val}) in self.VRToPR does not match the pair ({val}, {self.PRToVR[val]}) in self.PRToVR")
                return -1
        for key, val in self.PRToVR.items():
            if (val in self.VRToPR and self.VRToPR[val] != key):
                print(f"ERROR {line_num}: the pair ({key}, {val}) in self.PRToVR does not match the pair ({val}, {self.VRToPR[val]}) in self.VRToPR")
                return -1
        return 0
    
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


    # notes
        # doesnt match slide 14 (mult)- op3 pr is 3 not 2, vrtopr vr3 is wrong (vr3 should be pr2 not pr3), prtovr is wrong (pr2 is none but should be vr3, pr3 is 3 but should be none)
        # doesnt match slide 15 (add)- op2 pr is 3 not 2, op3 is 3 not 1, vrtopr vr0 is wrong (vr0 should be pr1 not pr3), prtovr is wrong (pr1 is none but should b3 0, pr3 is 0 but should be none)
        # doesnt match slide 

    def new_allocate(self):
        print("in new allocate!")
        head = self.IR_LIST.head
        line_num = 1

        while (head != None):
            # ----- USES --------
            print(head)
            print(self.IR_LIST.print_table(self.IR_LIST))
            print("VRToPR [")
            print(self.VRToPR)
            print("]")
            print("PRToVR [")
            print(self.PRToVR)
            print("]")

            if (head.opcode == 0):  # load
                self.allocate_use(1, head, line_num)
                self.free_use(1, head)
            if (head.opcode >= 3 and head.opcode <= 7): # arithop
                self.pr_used_in_cur_op = self.allocate_use(1, head, line_num)
                self.allocate_use(2, head, line_num)
                self.pr_used_in_cur_op = -1
                self.free_use(1, head)
                self.free_use(2, head)
            if (head.opcode == 1):  # store
                self.pr_used_in_cur_op = self.allocate_use(1, head, line_num)
                self.allocate_use(3, head, line_num)
                self.pr_used_in_cur_op = -1
                self.free_use(1, head)
                self.free_use(3, head)
            
            # ----- DEFS --------
            if (head.arg3.sr != None and head.opcode != 1):
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
            
            error = self.check_maps
            # print("error: " + str(error))

            # iterate
            head = head.next
            line_num += 1
        print(self.IR_LIST.print_table(self.IR_LIST))
        print("VRToPR [")
        print(self.VRToPR)
        print("]")
        print("PRToVR [")
        print(self.PRToVR)
        print("]")