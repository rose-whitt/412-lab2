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
    self.max_vr_num = self.max_sr_num;
    # Allocator maps
    self.VRToPR = {}
    self.PRToVR = {}
    self.VRToSpillLoc = {}
    self.PRNU = {}

    self.PRStack = [] # for spilling- (push and pop in algo)
    self.PRMark = {}  # make sure you're not reusing a pr in the current line
    
    print("//done with lab 2 init")
    

   
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
  
  def op_uses(self, operand):
    if (self.SR_to_VR[operand.sr] == INVALID):  # Last use
      self.SR_to_VR[operand.sr] = self.VR_name
      self.VR_name += 1
    operand.vr = self.SR_to_VR[operand.sr]
    operand.nu = self.LU[operand.sr]

  
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
  

  """
    Allocation helper that resets the mark in each pr to zero
  """
  def reset_marks(self):
    for pr in self.PRMark.keys():
      self.PRMark[pr] = 0
  
  """
    Allocation helper that gets the uses of the given OPCODE
  """
  def get_uses(self, line):
    if (line.opcode == LOAD_OP):
      uses = [line.arg1]
      print("//[get uses] load uses: " + str(line.arg1))
      
      return uses
    elif (line.opcode == ADD_OP or line.opcode == SUB_OP or line.opcode == MULT_OP or line.opcode == LSHIFT_OP or line.opcode == RSHIFT_OP):
      uses = [line.arg1, line.arg2]
      print("//[get uses] " + opcodes_list[line.opcode] + " uses: [" + str(line.arg1) + ", " + str(line.arg2) + "]")
      return uses
    elif (line.opcode == OUTPUT_OP):
      uses = []
      print("//[get uses] output uses: " + str(uses))
      return uses
    elif (line.opcode == NOP_OP):
      uses = []
      print("//[get uses] nop uses: " + str(uses))
      return uses
    elif (line.opcode == LOADI_OP):
      uses = []
      print("//[get uses] loadI uses: " + str(uses))
      return uses
    elif (line.opcode == STORE_OP):
      uses = [line.arg1, line.arg3]
      print("//[get uses] store uses: [" + str(line.arg1) + ", " + str(line.arg3) + "]")
      return uses
    else:
      uses = []
      print("//[get uses] couldnt find opcode for opcode: " + str(line.opcode))
      return uses

      
    
  """
    Allocation helper that gets the defs of the given OPCODE
  """
  def get_defs(self, line):
    if (line.opcode == LOAD_OP):
      defs = [line.arg3]
      print("//[get defs] load defs: [" + str(line.arg3) + "]")
      
      return defs
    elif (line.opcode == ADD_OP or line.opcode == SUB_OP or line.opcode == MULT_OP or line.opcode == LSHIFT_OP or line.opcode == RSHIFT_OP):
      defs = [line.arg3]
      print("//[get defs] " + opcodes_list[line.opcode] + " defs: [" + str(line.arg3) + "]")
      return defs
    elif (line.opcode == OUTPUT_OP):
      defs = []
      print("//[get defs] output defs: " + str(defs))
      return defs
    elif (line.opcode == NOP_OP):
      defs = []
      print("//[get defs] nop defs: " + str(defs))
      return defs
    elif (line.opcode == LOADI_OP):
      defs = [line.arg3]
      print("//[get defs] loadI defs: [" + str(line.arg3) + "]")
      return defs
    elif (line.opcode == STORE_OP):
      defs = []
      print("//[get defs] store defs: " + str(defs))
      return defs
    else:
      defs = []
      print("//[get defs] couldnt find opcode for opcode: " + str(line.opcode))
      return defs
    
  
  def get_pr(self, vr, nu):
    print("get_pr")
  
  def restore(self, vr, pr):
    print("restore")
  
  def free_pr(self, pr):
    print("free_pr")

  def check_maps(self):
    print("check_maps")



  
  """
    Main allocation funciton. Take the IR and allocate k registers to the code.

    Input:
        - k: maximum number of physical registers on this machine

  """
  def allocate(self, k):
    print("in allocate")
    vr = 0
    while (vr < self.max_vr_num):
      self.VRToPR[vr] = INVALID
      self.VRToSpillLoc[vr] = INVALID
      vr += 1
    
    pr = 0
    while (pr < k):
      self.PRToVR[pr] = INVALID
      self.PRNU[pr] = INF
      self.PRMark[pr] = 0
      self.PRStack.insert(0, pr)  # push(pr) in algo
      pr += 1
    
    line = self.IR_LIST.head
    # iterate over block
    while (line != None):
      # clear the mark in each pr
      self.reset_marks()
      

      
      print(line)
      defs = self.get_defs(line)
      uses = self.get_uses(line)

      # allocate uses
      for use in uses:
        pr = self.VRToPR[use.vr]
        print("pr: " + pr)
        if (pr == INVALID):
          print("gettin a pr")
          use.pr = self.get_PR(use.vr, use.nu)  # TODO: implement func
          # TODO: implement restore
          self.restore(use.vr, use.pr)  # TODO: implement func
        else:
          use.pr = pr
        
        self.PRMark[use.pr] = 1

      # check if last use
      for use in uses:
        if (use.nu == INF and not self.PRToVR[use.pr] == INVALID):
          self.free_PR(use.pr)  # TODO: implement func
      
      # clear mark in each pr
      self.reset_marks()

      # allocate defs
      for d in defs:
        d.pr = self.get_pr(d.vr, d.nu)  # TODO: implement func
        self.PRMark[d.pr] = 1
      
      print(line)
      self.check_maps() # TODO: implement func
      
      line = line.next
      

      

    


def main():
  print("//in main")
  lab2 = Lab2()
  # TODO: -h flag

  lab2.rename()
  if (sys.argv[1] == '-x'):
    lab2.print_renamed_block()
  elif (int(sys.argv[1]) >= 3 and int(sys.argv[1]) <= 64):
    lab2.allocate(int(sys.argv[1]))
    # lab2.print_renamed_block()


if __name__ == "__main__":
  main()