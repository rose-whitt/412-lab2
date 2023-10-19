//Parse succeeded, finding 25 ILOC operations.
loadI   2000  =>   r0
loadI   2000  =>   r1
load    r0  =>   r0
load    r1  =>   r1
loadI   2004  =>   r2
loadI   2008  =>   r3
loadI   1  =>   r4
add     r0, r0  =>   r5
add     r1, r4  =>   r4
store   r5  =>   r2
store   r4  =>   r3
add     r0, r5  =>   r5
add     r1, r4  =>   r1
store   r5  =>   r2
store   r1  =>   r3
add     r0, r5  =>   r5
add     r4, r1  =>   r4
store   r5  =>   r2
store   r4  =>   r3
add     r0, r5  =>   r5
add     r1, r4  =>   r4
store   r5  =>   r2
store   r4  =>   r3
output  2004
output  2008
