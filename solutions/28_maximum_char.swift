// Find maximum occuring character in a string
func maximumChar(inString: String)->Character{
	var max : Character = inString[inString.startIndex]

	for char in inString{
		if char > max{
			max = char
		}
	}

	return max
}

//TEST
var testString = "ABCDEFG"

var result = maximumChar(inString: testString)
assert(result == "G", "Found incorrect char \(result), not G")

testString = "ABCDEfG"
result = maximumChar(inString: testString)
assert(result == "f", "Found incorrect char \(result), not f")

testString = "zbdeFZ"
result = maximumChar(inString: testString)
assert(result == "z", "Found incorrect char \(result), not z")