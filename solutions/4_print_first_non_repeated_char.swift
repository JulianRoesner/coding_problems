// Print the first non-repeated character in a String

func printFirstNonRepeatedChar(inString : String){
	if let charToPrint = findFirstNonRepeatedChar(inString: inString) {
		print(charToPrint)
	}else{
		print("No single character")
	}
}

func findFirstNonRepeatedChar(inString: String) -> Character?{
	for char in inString{

		//Note: if we want to be case sensitive, do not lowercase inString
		if(inString.lowercased().filter{$0==char}.count == 1){	
			return char
		}
	}
	return nil

}


//TESTS
var testStringWithSingle = "Abbala"
var testStringWithNoSingle = "Abba"
var emptyString = ""

var result = findFirstNonRepeatedChar(inString: testStringWithSingle)
assert(result != nil, "Single non-repeated character not found in \(testStringWithSingle)")
assert(result! == "l", "Incorrect character \(result!) found in \(testStringWithSingle)")

result = findFirstNonRepeatedChar(inString: testStringWithNoSingle)
assert(result == nil, "Found a character \(result!) in \(testStringWithNoSingle)")

result = findFirstNonRepeatedChar(inString: emptyString)
assert(result == nil, "Found a character \(result!) in emptyString")