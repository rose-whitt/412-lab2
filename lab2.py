#!/usr/bin/python -u
import scanner
from IR_List import *
import lab1
import sys
import math
from rename import *
from allocate import *




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

def main():
    if (len(sys.argv) == 2 and sys.argv[1] == '-h'):
        help()
    elif (len(sys.argv) == 3 and sys.argv[1] == '-x'):
        renamer(sys.argv[2])
    elif (len(sys.argv) == 3 and sys.argv[1].isdigit()):
        k = int(sys.argv[1])
        if (k < 3 or k > 64):
            print(f"ERROR the number of registers (k) must be between 3 and 64", file=sys.stderr)
        else:
            allocator(sys.argv[1], sys.argv[2])
    else:
        help()


def help():
    """
    Helper function for -h (help) flag
    """
    f = open('help.txt', 'r')
    f_text = f.read()
    print(f_text)


def renamer(filename):
    """
    Helper function for -x (renaming) flag
    """
    print("renamer")
    lab1_obj = lab1.Lab1()  # init
    print("//done with lab 1 init")
    lab1_obj.main(True, False)
    renamer_obj = Rename(True, lab1_obj.ir_list, lab1_obj.max_reg, lab1_obj.num_srs)
    renamer_obj.rename()
    renamer_obj.print_renamed_block()

def allocator(k, filename):
    """
    Helper function for allocating k registers
    """
    print("allocator")
    lab1_obj = lab1.Lab1()  # init
    print("//done with lab 1 init")
    lab1_obj.main(True, False)
    renamer_obj = Rename(True, lab1_obj.ir_list, lab1_obj.max_reg, lab1_obj.num_srs)
    renamer_obj.rename()
    renamer_obj.print_renamed_block()
    # #print(f"MaxLive: {renamer_obj.maxlive}")
    allocator_obj = Allocate(True, renamer_obj.IR_LIST, int(k), renamer_obj.max_live, renamer_obj.VR_name, lab1_obj.max_reg, lab1_obj.num_srs)
    allocator_obj.new_allocate()
    # allocator_obj.print_allocated_file()


if __name__ == "__main__":
    main()