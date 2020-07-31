//Reverse an integer
func reverseInt(_ value: Int)->Int{
	var negative = 1
	if value < 0{
		negative = -1
	}

	var digits :[Int] = Array()

	var result = value * negative
	var rest : Int
	while result > 0{
		rest = result % 10
		result = result / 10
		digits.append(rest)
	}
	var reversedValue = 0
	for digit in digits{
		reversedValue *= 10
		reversedValue += digit
	}

	return reversedValue * negative
}


//TESTS
var expectedResult = 4321
var result = reverseInt(1234)
assert(result == expectedResult, "Got \(result); expected \(expectedResult)")

expectedResult = 123321
result = reverseInt(123321)
assert(result == expectedResult, "Got \(result); expected \(expectedResult)")

expectedResult = -17384
result = reverseInt(-48371)
assert(result == expectedResult, "Got \(result); expected \(expectedResult)")