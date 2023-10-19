
------------------------------------------------------------------------------------------------------------------------------------------------------
ncalls
for the number of calls.

tottime
for the total time spent in the given function (and excluding time made in calls to sub-functions)

percall
is the quotient of tottime divided by ncalls

cumtime
is the cumulative time spent in this and all subfunctions (from invocation till exit). This figure is accurate even for recursive functions.

percall
is the quotient of cumtime divided by primitive calls

------------------------------------------------------------------------------------------------------------------------------------------------------
2. removed while loop from inside insert_before (77.15% improvement)

11852596 function calls in 15.017 seconds

   Ordered by: cumulative time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.652    0.652    7.006    7.006 lab2.py:236(print_allocated_file)
        2    6.354    3.177    6.354    3.177 {built-in method builtins.print}
        1    0.301    0.301    4.058    4.058 lab2.py:275(dif_alloc)
        1    0.000    0.000    3.570    3.570 lab2.py:49(__init__)
        1    0.000    0.000    3.570    3.570 /storage-home/r/rew9/comp412/412-lab2/lab1.py:373(main)
        1    0.825    0.825    3.570    3.570 /storage-home/r/rew9/comp412/412-lab2/lab1.py:19(run)
   255992    0.186    0.000    3.514    0.000 lab2.py:97(allocate_use)
   113756    0.327    0.000    3.316    0.000 lab2.py:144(handle_restore)
   583024    1.459    0.000    2.379    0.000 /storage-home/r/rew9/comp412/412-lab2/IR_List.py:39(__init__)
   113756    0.582    0.000    1.997    0.000 lab2.py:193(handle_spill)
  1603347    1.156    0.000    1.178    0.000 /storage-home/r/rew9/comp412/412-lab2/scanner.py:127(get_token)
   128001    0.744    0.000    1.003    0.000 /storage-home/r/rew9/comp412/412-lab2/scanner.py:89(convert_line_to_ascii_list)
  1749072    0.920    0.000    0.920    0.000 /storage-home/r/rew9/comp412/412-lab2/IR_List.py:25(__init__)
        1    0.200    0.200    0.384    0.384 lab2.py:519(rename)
   113756    0.291    0.000    0.291    0.000 {built-in method builtins.max}
   455024    0.197    0.000    0.197    0.000 /storage-home/r/rew9/comp412/412-lab2/IR_List.py:120(insert_before)
  2863097    0.168    0.000    0.168    0.000 {method 'append' of 'list' objects}
   255992    0.122    0.000    0.138    0.000 lab2.py:121(free_use)
  2365335    0.117    0.000    0.117    0.000 {built-in method builtins.ord}
   255992    0.114    0.000    0.114    0.000 lab2.py:387(op_uses)
   127998    0.069    0.000    0.069    0.000 lab2.py:372(op_defines)
        1    0.066    0.066    0.066    0.066 lab2.py:402(get_max_vr)
   128000    0.059    0.000    0.059    0.000 /storage-home/r/rew9/comp412/412-lab2/IR_List.py:110(append)
   128001    0.027    0.000    0.028    0.000 {method 'readline' of '_io.TextIOWrapper' objects}
   128000    0.022    0.000    0.022    0.000 {method 'index' of 'list' objects}
   241756    0.018    0.000    0.018    0.000 {built-in method builtins.len}
   127998    0.017    0.000    0.017    0.000 {method 'pop' of 'list' objects}
   113756    0.012    0.000    0.012    0.000 {method 'remove' of 'list' objects}
        1    0.012    0.012    0.012    0.012 lab2.py:280(<dictcomp>)
      306    0.000    0.000    0.001    0.000 /usr/lib64/python3.6/codecs.py:318(decode)
      306    0.001    0.000    0.001    0.000 {built-in method _codecs.utf_8_decode}
      306    0.000    0.000    0.000    0.000 /usr/lib64/python3.6/codecs.py:330(getstate)
        1    0.000    0.000    0.000    0.000 {built-in method io.open}
        1    0.000    0.000    0.000    0.000 {method 'close' of '_io.TextIOWrapper' objects}
        1    0.000    0.000    0.000    0.000 /storage-home/r/rew9/comp412/412-lab2/scanner.py:53(__init__)
        1    0.000    0.000    0.000    0.000 /usr/lib64/python3.6/_bootlocale.py:23(getpreferredencoding)
        1    0.000    0.000    0.000    0.000 /storage-home/r/rew9/comp412/412-lab2/lab1.py:12(__init__)
        1    0.000    0.000    0.000    0.000 /storage-home/r/rew9/comp412/412-lab2/IR_List.py:103(__init__)
        1    0.000    0.000    0.000    0.000 {built-in method _locale.nl_langinfo}
        1    0.000    0.000    0.000    0.000 lab2.py:521(<listcomp>)
        1    0.000    0.000    0.000    0.000 lab2.py:522(<listcomp>)
        1    0.000    0.000    0.000    0.000 lab2.py:281(<dictcomp>)
        1    0.000    0.000    0.000    0.000 lab2.py:283(<dictcomp>)
        1    0.000    0.000    0.000    0.000 /usr/lib64/python3.6/codecs.py:259(__init__)
        1    0.000    0.000    0.000    0.000 /usr/lib64/python3.6/codecs.py:308(__init__)
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 {method 'reverse' of 'list' objects}




------------------------------------------------------------------------------------------------------------------------------------------------------
1.

1482321 function calls in 65.716 seconds

   Ordered by: cumulative time
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.050    0.050   63.201   63.201 lab2.py:275(dif_alloc)
    31992    0.030    0.000   63.040    0.002 lab2.py:97(allocate_use)
    14201    0.072    0.000   63.007    0.004 lab2.py:144(handle_restore)
    56804   62.642    0.001   62.642    0.001 /storage-home/r/rew9/comp412/412-lab2/IR_List.py:120(insert_before)
    14201    0.072    0.000   31.970    0.002 lab2.py:193(handle_spill)
        1    0.082    0.082    2.038    2.038 lab2.py:236(print_allocated_file)
        2    1.956    0.978    1.956    0.978 {built-in method builtins.print}
        1    0.000    0.000    0.427    0.427 lab2.py:49(__init__)
        1    0.000    0.000    0.427    0.427 /storage-home/r/rew9/comp412/412-lab2/lab1.py:373(main)
        1    0.103    0.103    0.427    0.427 /storage-home/r/rew9/comp412/412-lab2/lab1.py:19(run)
    72804    0.156    0.000    0.289    0.000 /storage-home/r/rew9/comp412/412-lab2/IR_List.py:39(__init__)
   200397    0.144    0.000    0.147    0.000 /storage-home/r/rew9/comp412/412-lab2/scanner.py:127(get_token)
   218412    0.133    0.000    0.133    0.000 /storage-home/r/rew9/comp412/412-lab2/IR_List.py:25(__init__)
    16001    0.087    0.000    0.120    0.000 /storage-home/r/rew9/comp412/412-lab2/scanner.py:89(convert_line_to_ascii_list)
        1    0.025    0.025    0.050    0.050 lab2.py:519(rename)
    14202    0.046    0.000    0.046    0.000 {built-in method builtins.max}
    31992    0.020    0.000    0.024    0.000 lab2.py:121(free_use)
   358492    0.024    0.000    0.024    0.000 {method 'append' of 'list' objects}
    31992    0.015    0.000    0.015    0.000 lab2.py:387(op_uses)
   296285    0.015    0.000    0.015    0.000 {built-in method builtins.ord}
    15998    0.009    0.000    0.009    0.000 lab2.py:372(op_defines)
    16000    0.007    0.000    0.007    0.000 /storage-home/r/rew9/comp412/412-lab2/IR_List.py:110(append)
        1    0.007    0.007    0.007    0.007 lab2.py:402(get_max_vr)
    15998    0.004    0.000    0.004    0.000 {method 'pop' of 'list' objects}
    16001    0.003    0.000    0.004    0.000 {method 'readline' of '_io.TextIOWrapper' objects}
    14201    0.003    0.000    0.003    0.000 {method 'remove' of 'list' objects}
    30201    0.003    0.000    0.003    0.000 {built-in method builtins.len}
    16000    0.003    0.000    0.003    0.000 {method 'index' of 'list' objects}
        1    0.002    0.002    0.002    0.002 lab2.py:280(<dictcomp>)
        1    0.000    0.000    0.000    0.000 {built-in method io.open}
        1    0.000    0.000    0.000    0.000 {method 'close' of '_io.TextIOWrapper' objects}
       40    0.000    0.000    0.000    0.000 /usr/lib64/python3.6/codecs.py:318(decode)
       40    0.000    0.000    0.000    0.000 {built-in method _codecs.utf_8_decode}
       40    0.000    0.000    0.000    0.000 /usr/lib64/python3.6/codecs.py:330(getstate)
        1    0.000    0.000    0.000    0.000 /storage-home/r/rew9/comp412/412-lab2/scanner.py:53(__init__)
        1    0.000    0.000    0.000    0.000 /usr/lib64/python3.6/_bootlocale.py:23(getpreferredencoding)
        1    0.000    0.000    0.000    0.000 /storage-home/r/rew9/comp412/412-lab2/lab1.py:12(__init__)
        1    0.000    0.000    0.000    0.000 lab2.py:521(<listcomp>)
        1    0.000    0.000    0.000    0.000 /storage-home/r/rew9/comp412/412-lab2/IR_List.py:103(__init__)
        1    0.000    0.000    0.000    0.000 {built-in method _locale.nl_langinfo}
        1    0.000    0.000    0.000    0.000 /usr/lib64/python3.6/codecs.py:308(__init__)
        1    0.000    0.000    0.000    0.000 lab2.py:522(<listcomp>)
        1    0.000    0.000    0.000    0.000 lab2.py:283(<dictcomp>)
        1    0.000    0.000    0.000    0.000 {method 'pop' of 'dict' objects}
        1    0.000    0.000    0.000    0.000 {method 'copy' of 'dict' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 lab2.py:281(<dictcomp>)
        1    0.000    0.000    0.000    0.000 {method 'reverse' of 'list' objects}
        1    0.000    0.000    0.000    0.000 /usr/lib64/python3.6/codecs.py:259(__init__)