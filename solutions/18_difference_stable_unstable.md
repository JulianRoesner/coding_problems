# What is the difference between stable and unstable sorting algorithm

A stable sorting algorithm will keep the order of keys with the same value the same compared to the original value. 
An unstable sorting algorithm can not guarantee this.

Example: sorting \[5,3,2x,1,2y\] (the x and y are only here to differentiate between the two 2s. They are both 2)

For a stable algorithm the result will always be: \[1,2x,2y,3,5\], while a unstable algorithm might produce \[1,2y,2x,3,5\]
