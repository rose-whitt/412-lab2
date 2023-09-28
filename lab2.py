import scanner
from IR_List import *
import lab1
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

class Lab2:
  def __init__(self):
    # Get IR
    self.Lab_1 = lab1.Lab1()  # init
    print("done with lab 1 init")

    self.Lab_1.main(True, False)
    print("done with lab 1 main")

    self.IR_LIST = self.Lab_1.ir_list
    self.IR_LIST.print_table(self.IR_LIST)
    # self.IR_LIST.print_list()

    self.max_sr_num = self.Lab_1.max_reg
    print("max reg num: " + str(self.max_sr_num))
    self.num_srs_filled = self.Lab_1.num_srs
    print("num srs filled: " + str(self.num_srs_filled))

    self.VR_name = 0
    self.SR_to_VR = []
    self.LU = []
    print("done with lab 2 init")
    

   
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
    return operand
  
  def rename(self):
    print("in rename")
    print("num srs filled: " + str(self.num_srs_filled))


    self.SR_to_VR = [INVALID for i in range(self.max_sr_num + 1)] # register numbers start at 0 so must be plus one the max register
    self.LU = [INF for i in range(self.max_sr_num + 1)]

    print(self.SR_to_VR)


    index = self.IR_LIST.length - 1

    OP = self.IR_LIST.tail
    while (OP != None):  # For each OPCODE (OP) in the block, bottom to top
      # print(OP.opcode)

      # Only want opcodes with registers: MEMOP, LOADI, and ARITHOP
      # registers in each:
      # MEMOP: arg1 and arg3
      # LOADI: arg3
      # ARTIHOP: arg1, arg2, arg3
      if (OP.opcode >= 0 and OP.opcode <= 7):
        #-------------
        # For each Operand (O) that OPCODE (OP) defines- third operand
        # if (OP.arg1.sr != None and OP.opcode != 2): # LOADI stores constant at first sr
        #   OP.arg1 = self.op_defines(OP.arg1)
        # if (OP.arg2.sr != None and OP.opcode != 0 and OP.opcode != 1 and OP.opcode != 2): # only ARITHOPs populate sr2
        #   OP.arg2 = self.op_defines(OP.arg2)

        
        if (OP.arg3.sr != None and OP.opcode != 1):  # all of them populate sr3, store's arg3 is a use, so dont define
          OP.arg3 = self.op_defines(OP.arg3)
        #-------------
        # For each Operand (O) that OPCODE (OP) uses- first and second operand

        #-------------
        # For each Operand (O) that OPCODE (OP) uses- first and second operand
      
      index -= 1
      OP = OP.prev
    
    self.IR_LIST.print_table(self.IR_LIST)

    

  
    


def main():
  print("in main")
  lab2 = Lab2()
  lab2.rename()

if __name__ == "__main__":
  main()