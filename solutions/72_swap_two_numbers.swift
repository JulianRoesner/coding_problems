//Swap two numbers without using a third; Remark: It is the same challenge as 12. I did it as an rehearsal and came up with the exact same solution down to the spaces
func swap(a: inout Int, b: inout Int){
	a += b
	b = a - b
	a = a - b
}

//TESTS SWAP
var a = 7
var b = 2

swap(a: &a, b: &b)
assert(a == 2, "A was not correctly swapped \(a)")
assert(b == 7, "B was not correctly swapped \(b)")