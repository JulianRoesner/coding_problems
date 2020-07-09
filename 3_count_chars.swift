/*Counting a given character in a string

Another solution would be: return inText.characters.filter { $0 == character }.count 
If it should not be case sensitive, we could just transform the text and character to lowercase first

*/
func count(character: Character, inText: String)->Int{
	var occurences = 0;

	for char in inText{
		occurences = char == character ? occurences + 1 : occurences
	}

	return occurences
}





//TESTS
var testString = "The force should b1 with you!"

//Missing character should not be found
var foundCount = count(character: "z", inText: testString)
assert(foundCount==0, "Missing character was found \(foundCount)")

//Space is correctly counted
foundCount = count(character: " ", inText: testString)
assert(foundCount==5, "Space character was found \(foundCount) instead of 5 times")

//Numbers are correctly counted
foundCount = count(character: "1", inText: testString)
assert(foundCount==1, "1 character was found \(foundCount) instead of 5 times")

//Characters are correctly counted
foundCount = count(character: "e", inText: testString)
assert(foundCount==2, "e character was found \(foundCount) instead of 5 times")