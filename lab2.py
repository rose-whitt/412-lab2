import scanner
from IR_List import *
import lab1
import sys

class Lab2:
  def __init__(self):
    # Get IR
    lab1.main(True, True)
    self.IR_LIST = lab1.ir_list
    self.max_sr_num = lab1.ir_list.length * 3
    self.VR_name = 0
    self.SR_to_VR = []
    self.LU = []

   

  def main():
    print("iN LAB2 MOFO")
    lab1.main(True, True)
    print(lab1.ir_list)
    print(lab1.ir_list.length)


  def rename():
    max_sr_num = lab1.ir_list.length * 3
    # for i in range(max_sr_num):

def main():
  print("in main")
  lab2 = Lab2()
  lab2
if __name__ == "__main__":
  main()