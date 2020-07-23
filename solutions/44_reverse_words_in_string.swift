//Reverse all the words in a string
func reverseWords (inString: String) -> String{
	var returnString = ""
	let letters : Set<Character> = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
	var currentWord = ""
	for char in inString{
		if letters.contains(char){
			currentWord = currentWord + String(char)
		}else{
			currentWord = reverse(this: currentWord)
			returnString = returnString + currentWord + String(char)
			currentWord = ""
		}
	}
	currentWord = reverse(this: currentWord)
	returnString = returnString + currentWord

	return returnString
}

func reverse(this: String) -> String{
	if(this.count <= 1){
		return this
	}else{
		return reverse(this: String(this[this.index(after: this.startIndex)...])) + String(this[this.startIndex])
	}
}

//TESTS
var emptyString = ""
var oneWord = "hallo"
var oneWordWithMark = "hallo!"
var manyWords = "hallo du. wie ists"


var empty = ""
var palindrome = "hannah"
var teststring = "abcdefg"

//Test reverse function
var result = reverse(this: empty)
assert(result == "", "Empty string was not correctly reversed \(result)")

result = reverse(this: palindrome)
assert(result == "hannah", "palindrom string was not correctly reversed \(result)")

result = reverse(this: teststring)
assert(result == "gfedcba", "teststring string was not correctly reversed \(result)")


//Test with words in a sentence
result = reverseWords(inString: emptyString)
assert(result == "", "Emptystring not correctly reversed \(result)")

result = reverseWords(inString: oneWord)
assert(result == "ollah", "OneWord not correctly reversed \(result)")

result = reverseWords(inString: oneWordWithMark)
assert(result == "ollah!", "oneWordWithMark not correctly reversed \(result)")


result = reverseWords(inString: manyWords)
assert(result == "ollah ud. eiw stsi", "Manywords not correctly reversed \(result)")