//Find duplicate characters in a string
func findDuplicates (inString: String) -> Set<Character>{
	var seenChars : Set<Character> = []

	for char in inString{
		if seenChars.contains(char) {
			// Uncomment this line to print print(char)
		}else{
			seenChars.insert(char)
		}
	}

	return seenChars
}

//Tests
func compare(result: Set<Character>, with: [Character])-> Bool{
	for char in with{
		if(!result.contains(char)){
			return false
		}
	}

	return true
}

var emptyString = ""
var noDuplicateString = "abcde" 
var duplicateString = "abbcdcCe"

var result = findDuplicates(inString: emptyString)
assert(compare(result: result, with: []), "Found duplicates in emptyString \(result)")

result = findDuplicates(inString: noDuplicateString)
assert(compare(result: result, with: []), "Found duplicates in noDuplicateString \(result)")

result = findDuplicates(inString: duplicateString)
assert(compare(result: result, with: ["b", "c"]) , "Found not correct duplicates in duplicateString \(result)")