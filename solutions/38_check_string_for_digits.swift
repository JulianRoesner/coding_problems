//Check if a string contains only digits
func onlyDigits(inString: String) -> Bool{
	if(inString.count < 1){
		return false
	}

	for charAsci in inString.utf8{
		if(charAsci < 48 || charAsci > 57){
			return false
		}	
	}

	return true
	
}

//TESTS
var noDigits = "abcdef"
var emptyString = ""
var mixed = "abcede123bdkkk"
var mixedAtEnd = "abcede123"
var mixedAtBeginning = "123bdkkk"
var specialChars = "12345?2"
var digits = "12348959"

assert (onlyDigits(inString: noDigits) != true, "Found digits in \(noDigits)")
assert (onlyDigits(inString: emptyString) != true, "Found digits in emptyString")
assert (onlyDigits(inString: mixed) != true, "Found digits in \(mixed)")
assert (onlyDigits(inString: mixedAtEnd) != true, "Found digits in \(mixedAtEnd)")
assert (onlyDigits(inString: mixedAtBeginning) != true, "Found digits in \(mixedAtBeginning)")
assert (onlyDigits(inString: specialChars) != true, "Found digits in \(specialChars)")
assert (onlyDigits(inString: digits) , "Found digits in \(digits)")