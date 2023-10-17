//in main
//done with lab 1 init
//Parse succeeded, finding 33 ILOC operations.
//done with lab 1 main
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        6        loadI      | 0     None  None  inf   | None  None  None  inf   | 0     None  None  inf   | 0               
//1        7        loadI      | 4     None  None  inf   | None  None  None  inf   | 1     None  None  inf   | 1               
//2        8        load       | 0     None  None  inf   | None  None  None  inf   | 10    None  None  inf   | 2               
//3        9        add        | 0     None  None  inf   | 1     None  None  inf   | 0     None  None  inf   | 3               
//4        10       load       | 0     None  None  inf   | None  None  None  inf   | 11    None  None  inf   | 4               
//5        11       add        | 0     None  None  inf   | 1     None  None  inf   | 0     None  None  inf   | 5               
//6        12       load       | 0     None  None  inf   | None  None  None  inf   | 12    None  None  inf   | 6               
//7        13       add        | 0     None  None  inf   | 1     None  None  inf   | 0     None  None  inf   | 7               
//8        14       load       | 0     None  None  inf   | None  None  None  inf   | 13    None  None  inf   | 8               
//9        15       add        | 0     None  None  inf   | 1     None  None  inf   | 0     None  None  inf   | 9               
//10       16       load       | 0     None  None  inf   | None  None  None  inf   | 14    None  None  inf   | 10              
//11       17       add        | 0     None  None  inf   | 1     None  None  inf   | 0     None  None  inf   | 11              
//12       18       load       | 0     None  None  inf   | None  None  None  inf   | 15    None  None  inf   | 12              
//13       19       add        | 0     None  None  inf   | 1     None  None  inf   | 0     None  None  inf   | 13              
//14       20       load       | 0     None  None  inf   | None  None  None  inf   | 16    None  None  inf   | 14              
//15       21       add        | 0     None  None  inf   | 1     None  None  inf   | 0     None  None  inf   | 15              
//16       22       load       | 0     None  None  inf   | None  None  None  inf   | 17    None  None  inf   | 16              
//17       23       add        | 0     None  None  inf   | 1     None  None  inf   | 0     None  None  inf   | 17              
//18       24       load       | 0     None  None  inf   | None  None  None  inf   | 18    None  None  inf   | 18              
//19       25       add        | 0     None  None  inf   | 1     None  None  inf   | 0     None  None  inf   | 19              
//20       26       load       | 0     None  None  inf   | None  None  None  inf   | 19    None  None  inf   | 20              
//21       28       add        | 10    None  None  inf   | 11    None  None  inf   | 20    None  None  inf   | 21              
//22       29       add        | 12    None  None  inf   | 13    None  None  inf   | 21    None  None  inf   | 22              
//23       30       add        | 14    None  None  inf   | 15    None  None  inf   | 22    None  None  inf   | 23              
//24       31       add        | 16    None  None  inf   | 17    None  None  inf   | 23    None  None  inf   | 24              
//25       32       add        | 18    None  None  inf   | 19    None  None  inf   | 24    None  None  inf   | 25              
//26       34       add        | 20    None  None  inf   | 21    None  None  inf   | 20    None  None  inf   | 26              
//27       35       add        | 22    None  None  inf   | 23    None  None  inf   | 21    None  None  inf   | 27              
//28       36       add        | 20    None  None  inf   | 24    None  None  inf   | 20    None  None  inf   | 28              
//29       37       add        | 20    None  None  inf   | 21    None  None  inf   | 20    None  None  inf   | 29              
//30       39       loadI      | 0     None  None  inf   | None  None  None  inf   | 0     None  None  inf   | 30              
//31       40       store      | 20    None  None  inf   | None  None  None  inf   | 0     None  None  inf   | 31              
//32       41       output     | 0     None  None  inf   | None  None  None  inf   | None  None  None  inf   | 32              
//max reg num: 24
//num srs filled: 83
//done with lab 2 init
//in rename
//num srs filled: 83
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        6        loadI      | 0     None  None  inf   | None  None  None  inf   | 0     30    None  2     | 0               
//1        7        loadI      | 4     None  None  inf   | None  None  None  inf   | 1     22    None  3     | 1               
//2        8        load       | 0     30    None  3     | None  None  None  inf   | 10    18    None  21    | 2               
//3        9        add        | 0     30    None  inf   | 1     22    None  5     | 0     29    None  4     | 3               
//4        10       load       | 0     29    None  5     | None  None  None  inf   | 11    19    None  21    | 4               
//5        11       add        | 0     29    None  inf   | 1     22    None  7     | 0     28    None  6     | 5               
//6        12       load       | 0     28    None  7     | None  None  None  inf   | 12    16    None  22    | 6               
//7        13       add        | 0     28    None  inf   | 1     22    None  9     | 0     27    None  8     | 7               
//8        14       load       | 0     27    None  9     | None  None  None  inf   | 13    17    None  22    | 8               
//9        15       add        | 0     27    None  inf   | 1     22    None  11    | 0     26    None  10    | 9               
//10       16       load       | 0     26    None  11    | None  None  None  inf   | 14    14    None  23    | 10              
//11       17       add        | 0     26    None  inf   | 1     22    None  13    | 0     25    None  12    | 11              
//12       18       load       | 0     25    None  13    | None  None  None  inf   | 15    15    None  23    | 12              
//13       19       add        | 0     25    None  inf   | 1     22    None  15    | 0     24    None  14    | 13              
//14       20       load       | 0     24    None  15    | None  None  None  inf   | 16    12    None  24    | 14              
//15       21       add        | 0     24    None  inf   | 1     22    None  17    | 0     23    None  16    | 15              
//16       22       load       | 0     23    None  17    | None  None  None  inf   | 17    13    None  24    | 16              
//17       23       add        | 0     23    None  inf   | 1     22    None  19    | 0     21    None  18    | 17              
//18       24       load       | 0     21    None  19    | None  None  None  inf   | 18    10    None  25    | 18              
//19       25       add        | 0     21    None  inf   | 1     22    None  inf   | 0     20    None  20    | 19              
//20       26       load       | 0     20    None  inf   | None  None  None  inf   | 19    11    None  25    | 20              
//21       28       add        | 10    18    None  inf   | 11    19    None  inf   | 20    8     None  26    | 21              
//22       29       add        | 12    16    None  inf   | 13    17    None  inf   | 21    9     None  26    | 22              
//23       30       add        | 14    14    None  inf   | 15    15    None  inf   | 22    6     None  27    | 23              
//24       31       add        | 16    12    None  inf   | 17    13    None  inf   | 23    7     None  27    | 24              
//25       32       add        | 18    10    None  inf   | 19    11    None  inf   | 24    5     None  28    | 25              
//26       34       add        | 20    8     None  inf   | 21    9     None  inf   | 20    4     None  28    | 26              
//27       35       add        | 22    6     None  inf   | 23    7     None  inf   | 21    3     None  29    | 27              
//28       36       add        | 20    4     None  inf   | 24    5     None  inf   | 20    2     None  29    | 28              
//29       37       add        | 20    2     None  inf   | 21    3     None  inf   | 20    0     None  31    | 29              
//30       39       loadI      | 0     None  None  inf   | None  None  None  inf   | 0     1     None  31    | 30              
//31       40       store      | 20    0     None  inf   | None  None  None  inf   | 0     1     None  inf   | 31              
//32       41       output     | 0     None  None  inf   | None  None  None  inf   | None  None  None  inf   | 32              
//renaming done
//allocating done
//HERE
loadI 0 => r30
loadI 4 => r22
load r30 => r18
add r30,r22 => r29
load r29 => r19
add r29,r22 => r28
load r28 => r16
add r28,r22 => r27
load r27 => r17
add r27,r22 => r26
load r26 => r14
add r26,r22 => r25
load r25 => r15
add r25,r22 => r24
load r24 => r12
add r24,r22 => r23
load r23 => r13
add r23,r22 => r21
load r21 => r10
add r21,r22 => r20
load r20 => r11
add r18,r19 => r8
add r16,r17 => r9
add r14,r15 => r6
add r12,r13 => r7
add r10,r11 => r5
add r8,r9 => r4
add r6,r7 => r3
add r4,r5 => r2
add r2,r3 => r0
loadI 0 => r1
store r0 => r1
output 0