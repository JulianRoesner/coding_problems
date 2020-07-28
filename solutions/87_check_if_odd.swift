//How to check if a number is odd or even without arithmetic operators; we assume it is a signed 32Int
func isOdd(number: Int32 )-> Bool{
	let bitMask: Int32 = 0x000001
	return (number & bitMask) == 0x000001
}

//Tests
var zero :Int32 = 0
var even :Int32 = 32
var odd :Int32 = 17

assert(!isOdd(number: zero), "Zero was classified as even")
assert(!isOdd(number: even), "Even was classified as odd")
even = -32
assert(!isOdd(number: even), "Negative even was classified as odd")
assert(isOdd(number: odd), "Odd was classified as even")