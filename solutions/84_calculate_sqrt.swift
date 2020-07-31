//Calculate the square root of an integer
import Foundation
func sqrtLong(_ of: UInt32) -> UInt32 {
	guard of > 1 else{
		return of
	}
	for i in 0..<of{
		if i * i >= of{
			return i
		}
		
	}
	return of - 1
}

//This uses digit by digit computation
func sqrtEfficient(_ of: UInt32) -> UInt32 {
	var bit : UInt32 = 1 << 30
	var result : UInt32 = 0
	var number : UInt32 = of

	while bit > number{
		bit = bit >> 2
	}
	while bit > 0{
		if number >= result + bit{

			number -= (result + bit)
			result = (result  >> 1) + bit
		}else{
			result = result >> 1
		}
		bit = bit >> 2

	}

	return result
}

//TESTS
var sqrtOf1 : UInt32 = 1
var sqrtOf4 : UInt32 = 2
var sqrtOf36: UInt32 = 6
var sqrtOf2 : UInt32 = UInt32(sqrt(2))

var result = sqrtLong(1)
assert(result == sqrtOf1, "Incorrect result \(result) for square root of 1, should have been \(sqrtOf1)")

result = sqrtLong(4)
assert(result == sqrtOf4, "Incorrect result \(result) for square root of 4, should have been \(sqrtOf4)")

result = sqrtLong(36)
assert(result == sqrtOf36, "Incorrect result \(result) for square root of 36, should have been \(sqrtOf36)")

result = sqrtLong(2)
assert(result == sqrtOf2, "Incorrect result \(result) for square root of 2, should have been \(sqrtOf2)")

result = sqrtEfficient(1)
assert(result == sqrtOf1, "Incorrect result \(result) for square root of 1, should have been \(sqrtOf1) eff")

result = sqrtEfficient(4)
assert(result == sqrtOf4, "Incorrect result \(result) for square root of 4, should have been \(sqrtOf4) eff")

result = sqrtEfficient(36)
assert(result == sqrtOf36, "Incorrect result \(result) for square root of 36, should have been \(sqrtOf36) eff")

result = sqrtEfficient(2)
assert(result == sqrtOf2, "Incorrect result \(result) for square root of 2, should have been \(sqrtOf2)")