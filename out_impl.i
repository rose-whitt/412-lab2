//in main
//done with lab 1 init
//Parse succeeded, finding 25 ILOC operations.
//done with lab 1 main
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        19       loadI      | 2000  -1    -1    inf   | -1    -1    -1    inf   | 0     -1    -1    inf   | 0               
//1        20       loadI      | 2000  -1    -1    inf   | -1    -1    -1    inf   | 10    -1    -1    inf   | 1               
//2        21       load       | 0     -1    -1    inf   | -1    -1    -1    inf   | 1     -1    -1    inf   | 2               
//3        22       load       | 10    -1    -1    inf   | -1    -1    -1    inf   | 11    -1    -1    inf   | 3               
//4        25       loadI      | 2004  -1    -1    inf   | -1    -1    -1    inf   | 2     -1    -1    inf   | 4               
//5        26       loadI      | 2008  -1    -1    inf   | -1    -1    -1    inf   | 12    -1    -1    inf   | 5               
//6        29       loadI      | 1     -1    -1    inf   | -1    -1    -1    inf   | 21    -1    -1    inf   | 6               
//7        32       add        | 1     -1    -1    inf   | 1     -1    -1    inf   | 4     -1    -1    inf   | 7               
//8        33       add        | 11    -1    -1    inf   | 21    -1    -1    inf   | 14    -1    -1    inf   | 8               
//9        34       store      | 4     -1    -1    inf   | -1    -1    -1    inf   | 2     -1    -1    inf   | 9               
//10       35       store      | 14    -1    -1    inf   | -1    -1    -1    inf   | 12    -1    -1    inf   | 10              
//11       38       add        | 1     -1    -1    inf   | 4     -1    -1    inf   | 5     -1    -1    inf   | 11              
//12       39       add        | 11    -1    -1    inf   | 14    -1    -1    inf   | 15    -1    -1    inf   | 12              
//13       40       store      | 5     -1    -1    inf   | -1    -1    -1    inf   | 2     -1    -1    inf   | 13              
//14       41       store      | 15    -1    -1    inf   | -1    -1    -1    inf   | 12    -1    -1    inf   | 14              
//15       44       add        | 1     -1    -1    inf   | 5     -1    -1    inf   | 6     -1    -1    inf   | 15              
//16       45       add        | 14    -1    -1    inf   | 15    -1    -1    inf   | 16    -1    -1    inf   | 16              
//17       46       store      | 6     -1    -1    inf   | -1    -1    -1    inf   | 2     -1    -1    inf   | 17              
//18       47       store      | 16    -1    -1    inf   | -1    -1    -1    inf   | 12    -1    -1    inf   | 18              
//19       50       add        | 1     -1    -1    inf   | 6     -1    -1    inf   | 7     -1    -1    inf   | 19              
//20       51       add        | 15    -1    -1    inf   | 16    -1    -1    inf   | 17    -1    -1    inf   | 20              
//21       52       store      | 7     -1    -1    inf   | -1    -1    -1    inf   | 2     -1    -1    inf   | 21              
//22       53       store      | 17    -1    -1    inf   | -1    -1    -1    inf   | 12    -1    -1    inf   | 22              
//23       56       output     | 2004  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 23              
//24       57       output     | 2008  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 24              
//max reg num: 21
//num srs filled: 56
//done with lab 2 init
//in rename
//num srs filled: 56
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        19       loadI      | 2000  -1    -1    inf   | -1    -1    -1    inf   | 0     14    -1    2     | 0               
//1        20       loadI      | 2000  -1    -1    inf   | -1    -1    -1    inf   | 10    13    -1    3     | 1               
//2        21       load       | 0     14    -1    inf   | -1    -1    -1    inf   | 1     6     -1    7     | 2               
//3        22       load       | 10    13    -1    inf   | -1    -1    -1    inf   | 11    10    -1    8     | 3               
//4        25       loadI      | 2004  -1    -1    inf   | -1    -1    -1    inf   | 2     3     -1    9     | 4               
//5        26       loadI      | 2008  -1    -1    inf   | -1    -1    -1    inf   | 12    1     -1    10    | 5               
//6        29       loadI      | 1     -1    -1    inf   | -1    -1    -1    inf   | 21    12    -1    8     | 6               
//7        32       add        | 1     6     -1    11    | 1     6     -1    7     | 4     11    -1    9     | 7               
//8        33       add        | 11    10    -1    12    | 21    12    -1    inf   | 14    8     -1    10    | 8               
//9        34       store      | 4     11    -1    11    | -1    -1    -1    inf   | 2     3     -1    13    | 9               
//10       35       store      | 14    8     -1    12    | -1    -1    -1    inf   | 12    1     -1    14    | 10              
//11       38       add        | 1     6     -1    15    | 4     11    -1    inf   | 5     9     -1    13    | 11              
//12       39       add        | 11    10    -1    inf   | 14    8     -1    16    | 15    4     -1    14    | 12              
//13       40       store      | 5     9     -1    15    | -1    -1    -1    inf   | 2     3     -1    17    | 13              
//14       41       store      | 15    4     -1    16    | -1    -1    -1    inf   | 12    1     -1    18    | 14              
//15       44       add        | 1     6     -1    19    | 5     9     -1    inf   | 6     7     -1    17    | 15              
//16       45       add        | 14    8     -1    inf   | 15    4     -1    20    | 16    5     -1    18    | 16              
//17       46       store      | 6     7     -1    19    | -1    -1    -1    inf   | 2     3     -1    21    | 17              
//18       47       store      | 16    5     -1    20    | -1    -1    -1    inf   | 12    1     -1    22    | 18              
//19       50       add        | 1     6     -1    inf   | 6     7     -1    inf   | 7     2     -1    21    | 19              
//20       51       add        | 15    4     -1    inf   | 16    5     -1    inf   | 17    0     -1    22    | 20              
//21       52       store      | 7     2     -1    inf   | -1    -1    -1    inf   | 2     3     -1    inf   | 21              
//22       53       store      | 17    0     -1    inf   | -1    -1    -1    inf   | 12    1     -1    inf   | 22              
//23       56       output     | 2004  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 23              
//24       57       output     | 2008  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 24              
//renaming done
//START OF DIF_ALLOC
//MAX VR NUM: 14
//k: 7
// LEN OF PRSTACK: 6
// PRSTACK: [5, 4, 3, 2, 1, 0]
// MAX LIVE: 6
// RESERVED REG: 6
// k after: 7
//✅[DIF_ALLOC] node (19: loadI) is rematerializable!
//loadI   2000  =>   rNone
//19       loadI      | 2000  -1    -1    inf   | -1    -1    -1    inf   | 0     14    -1    2    
//✅[DIF_ALLOC] node (20: loadI) is rematerializable!
//loadI   2000  =>   rNone
//20       loadI      | 2000  -1    -1    inf   | -1    -1    -1    inf   | 10    13    -1    3    
//load    rNone  =>   rNone
//21       load       | 0     14    -1    inf   | -1    -1    -1    inf   | 1     6     -1    7    
//allocate use
//21       load       | 0     14    -1    inf   | -1    -1    -1    inf   | 1     6     -1    7    
//PUSSY
//[ALLOCATE_USE] (line 21: load) may be declared in a loadI
//load    rNone  =>   rNone
//22       load       | 10    13    -1    inf   | -1    -1    -1    inf   | 11    10    -1    8    
//allocate use
//22       load       | 10    13    -1    inf   | -1    -1    -1    inf   | 11    10    -1    8    
//PUSSY
//[ALLOCATE_USE] (line 22: load) may be declared in a loadI
//✅[DIF_ALLOC] node (25: loadI) is rematerializable!
//loadI   2004  =>   rNone
//25       loadI      | 2004  -1    -1    inf   | -1    -1    -1    inf   | 2     3     -1    9    
//✅[DIF_ALLOC] node (26: loadI) is rematerializable!
//loadI   2008  =>   rNone
//26       loadI      | 2008  -1    -1    inf   | -1    -1    -1    inf   | 12    1     -1    10   
//✅[DIF_ALLOC] node (29: loadI) is rematerializable!
//loadI   1  =>   rNone
//29       loadI      | 1     -1    -1    inf   | -1    -1    -1    inf   | 21    12    -1    8    
//add     rNone, rNone  =>   rNone
//32       add        | 1     6     -1    11    | 1     6     -1    7     | 4     11    -1    9    
//allocate use
//32       add        | 1     6     -1    11    | 1     6     -1    7     | 4     11    -1    9    
//allocate use
//32       add        | 1     6     0     11    | 1     6     -1    7     | 4     11    -1    9    
//add     rNone, rNone  =>   rNone
//33       add        | 11    10    -1    12    | 21    12    -1    inf   | 14    8     -1    10   
//allocate use
//33       add        | 11    10    -1    12    | 21    12    -1    inf   | 14    8     -1    10   
//BITCH
//[ALLOCATE_USE] (line 33: add, arg2) may be declared in a loadI
//allocate use
//33       add        | 11    10    1     12    | 21    12    -1    inf   | 14    8     -1    10   
//BITCH
//store   rNone  =>   rNone
//34       store      | 4     11    -1    11    | -1    -1    -1    inf   | 2     3     -1    13   
//allocate use
//34       store      | 4     11    -1    11    | -1    -1    -1    inf   | 2     3     -1    13   
//CUNT
//[ALLOCATE_USE] (line 34: store) may be declared in a loadI
//allocate use
//34       store      | 4     11    5     11    | -1    -1    -1    inf   | 2     3     -1    13   
//CUNT
//store   rNone  =>   rNone
//35       store      | 14    8     -1    12    | -1    -1    -1    inf   | 12    1     -1    14   
//allocate use
//35       store      | 14    8     -1    12    | -1    -1    -1    inf   | 12    1     -1    14   
//CUNT
//[ALLOCATE_USE] (line 35: store) may be declared in a loadI
//allocate use
//35       store      | 14    8     4     12    | -1    -1    -1    inf   | 12    1     -1    14   
//CUNT
//add     rNone, rNone  =>   rNone
//38       add        | 1     6     -1    15    | 4     11    -1    inf   | 5     9     -1    13   
//allocate use
//38       add        | 1     6     -1    15    | 4     11    -1    inf   | 5     9     -1    13   
//allocate use
//38       add        | 1     6     0     15    | 4     11    -1    inf   | 5     9     -1    13   
//add     rNone, rNone  =>   rNone
//39       add        | 11    10    -1    inf   | 14    8     -1    16    | 15    4     -1    14   
//allocate use
//39       add        | 11    10    -1    inf   | 14    8     -1    16    | 15    4     -1    14   
//allocate use
//39       add        | 11    10    1     inf   | 14    8     -1    16    | 15    4     -1    14   
//store   rNone  =>   rNone
//40       store      | 5     9     -1    15    | -1    -1    -1    inf   | 2     3     -1    17   
//allocate use
//40       store      | 5     9     -1    15    | -1    -1    -1    inf   | 2     3     -1    17   
//CUNT
//[ALLOCATE_USE] (line 40: store) may be declared in a loadI
//allocate use
//40       store      | 5     9     5     15    | -1    -1    -1    inf   | 2     3     -1    17   
//CUNT
//store   rNone  =>   rNone
//41       store      | 15    4     -1    16    | -1    -1    -1    inf   | 12    1     -1    18   
//allocate use
//41       store      | 15    4     -1    16    | -1    -1    -1    inf   | 12    1     -1    18   
//CUNT
//[ALLOCATE_USE] (line 41: store) may be declared in a loadI
//allocate use
//41       store      | 15    4     1     16    | -1    -1    -1    inf   | 12    1     -1    18   
//CUNT
//add     rNone, rNone  =>   rNone
//44       add        | 1     6     -1    19    | 5     9     -1    inf   | 6     7     -1    17   
//allocate use
//44       add        | 1     6     -1    19    | 5     9     -1    inf   | 6     7     -1    17   
//allocate use
//44       add        | 1     6     0     19    | 5     9     -1    inf   | 6     7     -1    17   
//add     rNone, rNone  =>   rNone
//45       add        | 14    8     -1    inf   | 15    4     -1    20    | 16    5     -1    18   
//allocate use
//45       add        | 14    8     -1    inf   | 15    4     -1    20    | 16    5     -1    18   
//allocate use
//45       add        | 14    8     4     inf   | 15    4     -1    20    | 16    5     -1    18   
//store   rNone  =>   rNone
//46       store      | 6     7     -1    19    | -1    -1    -1    inf   | 2     3     -1    21   
//allocate use
//46       store      | 6     7     -1    19    | -1    -1    -1    inf   | 2     3     -1    21   
//CUNT
//[ALLOCATE_USE] (line 46: store) may be declared in a loadI
//allocate use
//46       store      | 6     7     5     19    | -1    -1    -1    inf   | 2     3     -1    21   
//CUNT
//store   rNone  =>   rNone
//47       store      | 16    5     -1    20    | -1    -1    -1    inf   | 12    1     -1    22   
//allocate use
//47       store      | 16    5     -1    20    | -1    -1    -1    inf   | 12    1     -1    22   
//CUNT
//[ALLOCATE_USE] (line 47: store) may be declared in a loadI
//allocate use
//47       store      | 16    5     4     20    | -1    -1    -1    inf   | 12    1     -1    22   
//CUNT
//add     rNone, rNone  =>   rNone
//50       add        | 1     6     -1    inf   | 6     7     -1    inf   | 7     2     -1    21   
//allocate use
//50       add        | 1     6     -1    inf   | 6     7     -1    inf   | 7     2     -1    21   
//allocate use
//50       add        | 1     6     0     inf   | 6     7     -1    inf   | 7     2     -1    21   
//add     rNone, rNone  =>   rNone
//51       add        | 15    4     -1    inf   | 16    5     -1    inf   | 17    0     -1    22   
//allocate use
//51       add        | 15    4     -1    inf   | 16    5     -1    inf   | 17    0     -1    22   
//allocate use
//51       add        | 15    4     1     inf   | 16    5     -1    inf   | 17    0     -1    22   
//store   rNone  =>   rNone
//52       store      | 7     2     -1    inf   | -1    -1    -1    inf   | 2     3     -1    inf  
//allocate use
//52       store      | 7     2     -1    inf   | -1    -1    -1    inf   | 2     3     -1    inf  
//CUNT
//[ALLOCATE_USE] (line 52: store) may be declared in a loadI
//allocate use
//52       store      | 7     2     5     inf   | -1    -1    -1    inf   | 2     3     -1    inf  
//CUNT
//store   rNone  =>   rNone
//53       store      | 17    0     -1    inf   | -1    -1    -1    inf   | 12    1     -1    inf  
//allocate use
//53       store      | 17    0     -1    inf   | -1    -1    -1    inf   | 12    1     -1    inf  
//CUNT
//[ALLOCATE_USE] (line 53: store) may be declared in a loadI
//allocate use
//53       store      | 17    0     4     inf   | -1    -1    -1    inf   | 12    1     -1    inf  
//CUNT
//output  2004
//56       output     | 2004  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf  
//output  2008
//57       output     | 2008  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf  
//allocating done
// MaxLive is 6
//DONE
