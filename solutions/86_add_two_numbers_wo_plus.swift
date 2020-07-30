//Add two numbers without using the plus operator
func add(_ a: UInt32, _ b: UInt32) -> UInt32{
	var finalResult : UInt32 = 0x00000000
	var result : UInt32 
	var bitMask : UInt32 = 0x00000001
	var carryIn : UInt32 = 0x00000000
	var carryOut : UInt32 = 0x00000000
	var carryBy : UInt32 = 0x00000000
	for _ in 0..<32{
		result = a ^ b 
		result = result & bitMask
		carryOut = (a & b) & bitMask
		carryBy = (result & carryIn) & bitMask
		result = (result ^ carryIn) & bitMask
		carryOut = carryOut | carryBy

		carryIn = carryOut << 1
		bitMask = bitMask << 1

		finalResult += result

	}

	return finalResult


}

//TEST
var a: UInt32 = 12
var b : UInt32 = 25

var result = add(a,b)
assert( result == 37, "Got incorrect result \(result) should have been 37")