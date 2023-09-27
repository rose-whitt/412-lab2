import scanner
from IR_List import *
import lab1
import sys
import math

# MACROS
INVALID = -1
INF = math.inf

class Lab2:
  def __init__(self):
    # Get IR
    lab1.main(True, True)
    self.IR_LIST = lab1.ir_list
    self.max_sr_num = lab1.ir_list.length * 3
    self.VR_name = 0
    self.SR_to_VR = []
    self.LU = []
    

   
  def rename(self):
    print("in rename")

    self.SR_to_VR = [INVALID for i in range(self.max_sr_num)]
    self.LU = [INF for i in range(self.max_sr_num)]

    index = self.IR_LIST.length - 1

    OP = self.IR_LIST.tail
    while (OP != None):  # For each OPCODE (OP) in the block, bottom to top
      print(OP)
      OP = OP.prev
    


def main():
  print("in main")
  lab2 = Lab2()
  lab2.rename()
if __name__ == "__main__":
  main()