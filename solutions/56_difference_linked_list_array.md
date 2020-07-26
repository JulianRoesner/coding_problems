# What is the difference between a linked list and an array

## Array
- fixed length
- fixed reserved space for elements
- elements are stored behind each other in memory -> large enough chunk of connected available space is needed
- elements of the array can be indexed and therefore easily accessed O(1)
- adding or removing is difficult, because the array has to be rearranged
- can be mutli-dimensional

## Linked List
- variable length
- no fixed space
- elements are stored somewehere in space and connected via pointers, which need to be stored at every element in addition to the value
- to access elements the linked list has to be traversed O(n)
- adding or deleting, if correct pointer is available, has 0(1), but at unknown position is O(n)
- can be either a singly-linked-list or a doubly-linked-list