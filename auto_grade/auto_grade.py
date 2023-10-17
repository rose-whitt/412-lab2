#!/usr/bin/python3

import os, time, calendar, datetime
from datetime import date, timedelta, datetime
from changeto_testlocation import change_to_test_location, locate_exe
from lab2_grade import lab2_grade
from get_id import get_id
import operator

#
#  Configuration directions
#
#  1. Set the base_name to point to the directory above the current directory
#     -- that is the directory that contains the file "Grader".
#
#  2. Set "normal_deadline", if necessary
#

# base_name must end with a slash ("/")
base_name = "/storage-home/r/rew9/comp412/412-lab2/"
#base_name = "/clear/courses/comp412/CodeBase/Lab2/2023-L2AG/update/"

# The on-time due date for the assignment
normal_deadline = date(2023,10,18)    # set annually

#
# Stuff after this point should be set when the lab handout changes or 
# the software changes.
#

blocks_dir = "auto_grade/blocks/"
timing_dir = "auto_time/timing_blocks/"

test_dir = base_name + blocks_dir

#
early_day_limit = timedelta(days=2)   # determined by the grading rubric
late_day_limit  = timedelta(days=5)   # determined by the grading rubric
archive_date    = date(2100,1,1)      # impossibly far in the future

def check_file_type(type):
    for cdir, dirs, files in os.walk('./'):
        for file in files:
            if type in file:
                return True
    return False

def manual_clean(submission):
    #remove the jar file if submitted in java
    if check_file_type('.java'):
        # change in jar file handling
        os.system('rm `find -name "*.jar"` >&/dev/null')

def run_test(submission):

    dir = test_dir
    sim = '/clear/courses/comp412/students/lab2/sim'
    num_regs = [3, 4, 5, 6, 8, 12, 16]

    result = {}

    print("\nResult is a set of (k, cycle) pairs for each test block\n")
    for test in sorted(os.listdir(dir)):
        if not '.i' in test:
            continue
        result[test] = lab2_grade(dir+test,test,sim,num_regs,submission)
    return result
 
def get_input(file):
    f = open(file, 'r')
    input = ""
    while True:
        line = f.readline()
        if line == "":
            break
        if 'SIM INPUT' in line:
            input = line.split(':')[1]
            break
    return input.strip()

def get_ref_cycles():
    num_regs = [3, 4, 5, 6, 8, 12, 16]
    lab_loc = '/clear/courses/comp412/students/lab2/'
    lab_ref = lab_loc + 'lab2_ref'
    lab_sim = lab_loc + 'sim'
    dir = test_dir
    results = {}

    print ("==================================================")
    print("Running lab2_ref to establish effectiveness baselines")
    for test in sorted(os.listdir(dir)):
        results [test] = {}
    for test in sorted(os.listdir(dir)):
        test_file = dir+test
        input = get_input(test_file)
        for r in num_regs :
            os.system(lab_ref + ' -w ' + str(r) +' '+ test_file  + ' | ' + lab_sim + ' -r ' + str(r) + ' ' + input  +' | grep cycles > out')
            f = open('out', 'r')
            line = f.readline()
            f.close()
            #print("lab2_ref @ k = ",r,":\t",line[:len(line)-2])
            results[test][str(r)] = line.rsplit(' ', 2)[1]
    os.system('rm -rf out')
    print ("==================================================")

    return results

def average_result(result, ref_result):
    min_constant = 1
    dir = test_dir
    sum = 0.0
    count = 0
    for block in sorted(os.listdir(dir)):
        subsum= 0.0
        subcount = 0
        for test in result[block] :
            cycle = float(result[block][test])
            ref_cycle = float(ref_result[block][str(test)])
            subsum = subsum + min(min_constant, (cycle - ref_cycle)/ref_cycle)
            subcount = subcount + 1
        subsum = subsum/subcount
        sum += subsum
        count += 1
    return sum/count
    
def check_correctness(result):
    dir = test_dir
    total_test = 0
    for item in os.listdir(dir):
        total_test = total_test + 1
    total_test *= 7; # 7 is the length of num_regs
    correct_count = total_test
    for block in result.keys():
        for test in result[block]:
            if result[block][test] == '100000':
                correct_count = correct_count - 1
            #print str(block) + '===' +str(test) +'  '+ result[block][test]

    #print '======' + str(correct_count) + '======' + str(total_test)
    return 100.0 * correct_count / total_test


#
#  Run the SLOCs timing test on the submisison
#
def run_timing_block(block_name):

    path = base_name + timing_dir

    command_line = "timeout 60.0s ./412alloc 15 "+path+block_name+">&/dev/null"
    #print(command_line)

    start_tic = time.perf_counter()
    os.system(command_line)
    stop_tic = time.perf_counter()
    elapsed = stop_tic - start_tic

    return elapsed

def run_scalability( ):
    # Scalability testing                                      
    global t_names
    global t_sizes

    times = {}
                           
    scales = 0
    print("\nQuick Scalability Test:")
    print("\t(For a more accurate test, run the auto-timer)\n")

    short_circuit = 0
    for i in range(0,5):
        if short_circuit == 0:
            ms = run_timing_block(t_names[i])
            times[str(t_sizes[i])] = ms
            if ms > 59.0:
                short_circuit = 1
        else:
            times[str(t_sizes[i])] = 60.0
            

    for i in range(0,5):
        print("\t"+t_names[i]+":  \t"+str(times[str(t_sizes[i])])[0:6]+" seconds")

    return times


def grade_scalability(times):

    fail_ct   = 0
    linear_ct = 0
    nonlin_ct = 0
    quad_ct   = 0
    for i in range(1,4):
        if times[str(t_sizes[i])] == 0:
            ratio = 100000
        else:
            ratio = times[str(t_sizes[i+1])]/times[str(t_sizes[i])]
        if ratio < 1.1:
            fail_ct +=1
        if ratio < 2.3:
            linear_ct += 1
        elif ratio > 3.6:
            quad_ct += 1
        else:
           nonlin_ct += 1

    if fail_ct > 0:
        print("\n   The code may not work; "+str(fail_ct)+" codes showed no growth")
        scales = 0
    if nonlin_ct == 0:
        print("   Scaling appears to be linear")
        scales = 100
    elif nonlin_ct == 1:
        print("   Scaling may be linear with one jump")
        scales = 90
    elif quad_ct > 2:
        print("   Scaling appears to quadratic")
        scales = 0
    else:
        print("\n   Scaling appears to be non-linear")
        scales = 50

    return scales

def main():
    #run in the dir of submitted tar files...
    global root
    global tests

    global t_names
    global t_sizes
    global t_times

    root = os.getcwd()

    #for each submission:
    #1. make a tmp dir
    #2. cp the tar ball to the dir
    #3. extract and the tar ball
    #4. locate the makefile or the executable
    #5. ready to run with the executable

    result = {}
    names = {}
    dates = {}
    failed = []

    t_names =  ["T008k.i","T016k.i","T032k.i","T064k.i","T128k.i"]
    t_sizes =  [8, 16, 32, 64, 128]
    t_times =  {}

    if not os.path.isdir(base_name):
        print('\nNeed to set "base_name" in auto_grade/auto_grade.py\n\n')
        exit(-1)

    for submission in sorted(os.listdir('./')):
        result_temp = {}
        if os.path.isdir(submission):
            continue

        print ("==================================================")
        archive_date = change_to_test_location(submission)
        name, ID = get_id()
        if ID == "":
           ID = submission.split('.')[0].strip()
        #name = name + "\t" + ID

        print("Testing submission from NetID '"+ID+"', name '"+name+"'")
        print("Archive name: ",submission,"\t\tDate From Files: ",str(archive_date))

        names [ID] =name
        dates [ID] = archive_date

        manual_clean(submission)

        print("\n------------------------------------------------------------")
        print("Output from building executable, if necessary")

        if not locate_exe(submission) == -1:
            print("-----------------------------------------------------------\n")
            result[ID] = run_test(submission)
            t_times[ID] = run_scalability()
            print(" ")
            print ('\nFinished submission ', submission)
        else:
            print("-----------------------------------------------------------\n")
            failed.append(ID)


        #clean up everything that was created during testing
        os.chdir(root)
        fixed_submission = submission.replace(" ", "\ ").replace("(", "\(").replace(")", "\)").replace("'", "\\'")
        folder = submission.split('.', 1)[0]
        fixed_folder = fixed_submission.split('.', 1)[0]
        os.system('rm ' + fixed_folder + ' -rf')


    # write the detailed result files.
    sorted_id = sorted(result.keys(), key=lambda s: s.lower())
    dir = test_dir
    result_dir = base_name + "results/"
    for test in sorted(os.listdir(dir)):
        result_file = open(result_dir + 'result_file_'+test.split('.')[0].strip()+ '.txt', 'w') 
        for id in sorted_id:
            #print '\t'+id+', ',
            result_file.write(id+'\t')
            result_for_id = result[id][test]
            for value in result_for_id.values():
                result_file.write(str(value) + '\t')
            result_file.write('\n')
    result_file.close()

    #calculate the points
    lab_ref = '/clear/courses/comp412/students/lab2/lab2_ref'
    sim = '/clear/courses/comp412/students/lab2/sim'
    ref_results = get_ref_cycles()

    print("Concise results (% of points in each category)\n")
    Scores = open(result_dir+'Scores'+ '.txt', 'w')
    Scores.write('Name\tnetID\tCorr.\tEff.\tScal.\tDate\tDays Late\n')
    for id in sorted_id:
        print(names[id],":")
        corr = str(check_correctness(result[id]))
        if len(corr) > 6:
            corr = corr[0:6]
        print("   Correctness points:    ",corr)
        eff = str(min(100.0,100*(1-average_result(result[id], ref_results))))
        if len(eff) > 6:
            eff = eff[0:6]
        print("   Effectiveness points:  ",eff)
        print("\nScalability points are a rough approximation.")
        print("Run the auto_timer to get a more precise estimate.\n")
        scale = str(grade_scalability(t_times[id]))
        if len(scale) > 6:
            scale = scale[0:6]
        print("   Scalability points:    ",scale,"\n")
        Scores.write(names[id]+'\t'+id+'\t'+corr+'\t'+eff+'\t'+scale)
        # days late calculation

        diff = dates[id] - normal_deadline
        if diff < -early_day_limit:
            diff = -early_day_limit
        elif diff > late_day_limit:
            diff = late_day_limit

        Scores.write("\t"+str(dates[id])+"\t"+str(diff.days)+"\n")
    Scores.close()

    failed_file = open(result_dir+'failed'+ '.txt', 'w')
    for id in failed:
        failed_file.write(id+ '\n')
    failed_file.close()

    #print('\nNormal Exit\n')

if __name__ == "__main__":
    main()
