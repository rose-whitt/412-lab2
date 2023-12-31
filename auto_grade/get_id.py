#!/usr/bin/python3

import os

def check_file_type(type):
    for cdir, dirs, files in os.walk('./'):
        for file in files:
            if type in file:
                #if file.rsplit('.',1)[1].strip() == "i":
                #    return True
                return True
    return False

def get_id():
    #if not check_file_type('.i'):
    #    return "", ""
    tmp_file = 'tmpdump'
    #getname
    os.system("find . -iname \"README*\" > " + tmp_file)
    f = open(tmp_file, 'r')
    line = f.readline()
    if line == "":
        f.close()
        os.system('rm ' + tmp_file)
        print ("NO README file found\nWill lose conformance points.\n")
        return "no README", "no README"

    tmp_file = "tmpdump2"
    cmd =  "grep -r 'NAME' `find -name \"README*\"` > " + tmp_file
    os.system(cmd)
    f = open(tmp_file, 'r')
    line = f.readline()
    name = ""
    if 'NAME' in line:
        name = line.rsplit(':', 1)[1].strip()
    else:
        print("\nStudent name not found in README file.")
        print("Will lose conformance points.\n")
        name = "no name given"
    f.close()
    os.system('rm -rf ' + tmp_file)

    #get ID
    tmp_file = "tmpdump3"
    cmd =  "grep -r 'NETID' `find -name \"README*\"` > " + tmp_file
    os.system(cmd)
    f = open(tmp_file, 'r')
    line = f.readline()
    ID = ""

    if 'NETID' in line:
        ID = line.rsplit(':', 1)[1].strip()
    else:
        print("\nStudent netid not found in README file.")
        print("Will lose conformance points.\n")
        ID = "no netid given"
    f.close()

    os.system('rm -rf ' + tmp_file)

    if name !="" and name[0] == '<':
        print("In README file, the NAME starts with '<'.")
        print("It should simply contain the student's name.")
        print("Please fix this problem!\n")
    
    #print('Found NetID: '+ID+' and name: '+name)
    return name, ID
