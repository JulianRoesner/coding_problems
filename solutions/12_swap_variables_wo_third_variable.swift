//Swap two variables without a third variable
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