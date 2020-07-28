//Check if a given number is positive; we assume it is a signed Int
func isPositive(number: Int32 )-> Bool{
	let bitMask: Int32 = 0x100000

	return (number & bitMask) == 0x000000
}

//Tests
var zero :Int32 = 0
var negative :Int32 = -32
var positive :Int32 = 16

assert(isPositive(number: zero), "Zero was classified as negative")
assert(!isPositive(number: negative), "Negative was classified as positive")
assert(isPositive(number: positive), "Positive was classified as negative")