from IR_List import *
import sys
import math

CATEGORIES = ["MEMOP", "LOADI", "ARITHOP", "OUTPUT", "NOP", "CONST", "REG", "COMMA", "INTO", "ENDFILE", "NEWLINE"]
# only want to process opcodes with registers, which is index 0 through 7
opcodes_list = ["load", "store", "loadI", "add", "sub", "mult", "lshift", "rshift", "output", "nop"]


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

class Rename:
    """
        debug: true if want to print debugging things (like table)
    """
    def __init__(self, DEBUG, ir_list, max_reg, num_srs):
        # Get IR
        self.DEBUG = DEBUG
        # print("debug: " + str(self.DEBUG))
        self.IR_LIST = ir_list
        # if (self.DEBUG):
        #     self.IR_LIST.print_table(self.IR_LIST)
        # self.IR_LIST.print_list()

        self.max_sr_num = max_reg
        # if (self.DEBUG):
        #     print("//max reg num: " + str(self.max_sr_num))
        self.num_srs_filled = num_srs
        # if (self.DEBUG):
        #     print("//num srs filled: " + str(self.num_srs_filled))

        self.VR_name = 0
        self.SR_to_VR = []
        self.LU = []

        self.count_live = 0
        self.max_live = 0

        # if (self.DEBUG):
        #     print("//done with lab 2 init")
            
        

   
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
        # if (self.DEBUG):
        #     print("op_defines: " + str(self.count_live))
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

  
    def rename(self):
        # if (self.DEBUG):
        #     print("//in rename")
        # if (self.DEBUG):
        #     print("//num srs filled: " + str(self.num_srs_filled))


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

                # REGISTER IS A DEF
                if (OP.arg3.sr != None and OP.opcode != 1):  # all of them populate sr3, store's arg3 is a use, so dont define
                    OP.arg3 = self.op_defines(OP.arg3)
                #-------------
                # For each Operand (O) that OPCODE (OP) uses- first and second operand
                
                # REGISTER IS A USE
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
        
        # if (self.DEBUG):
        #     self.IR_LIST.print_table(self.IR_LIST)

    
    def print_renamed_block(self):
        start = self.IR_LIST.head
        # if (self.DEBUG):
        #     print("//HERE")
        while (start != None):
            print(start)
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
