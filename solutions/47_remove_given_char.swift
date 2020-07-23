//Remove all occurences of a specific character with another one
func remove(this: Character, with: String, inString: String) -> String{
	var resultingString = ""
	for char in inString{
		if char == this{
			resultingString += String(with)
		}else{
			resultingString += String(char)
		}
	}

	return resultingString
} 

//TESTS
var testString = "H a l l o"
var shouldBe = "Hallo"

var result = remove(this: Character(" "), with: "", inString: testString)
assert(result == shouldBe, "Not correctly removed \(result)")