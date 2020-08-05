# What is the difference between comparison and non-comparison sorting algorithms?

## Comparison sorting
Comparison sorting algorithms compare items with each other to sort them. That means, that each item is at least compared to one other item.
For example insertion sort is such a type of algorithm.
They can never have a better worst case complexity than O(N log N).

## Non-comparison sorting
Non-comparison sorting algorithms sort items without comparing them to each other, but just because of their value. However they need special conditions to have a good runtime (for example a good distribuition). Under such conditions their complexity can be better in the worst case than comparison sort algorithms.
For example radix sort or bucket sort.