//Find the longest substring without repeating characters
func longestSubstring(of: String)->String{
	var result = ""
	for i in 0..<of.count{
		let nextSub = nextSubstring(of: of, from: i)
		if(nextSub.count > result.count){
			result = nextSub
		}
	}

	return result
}

func nextSubstring(of: String, from: Int)->String{
	var seenChars : Set<Character> = []
	var subString : String = ""
	
	for i in from..<of.count{
		let currentChar = of[of.index(of.startIndex, offsetBy: i)]
		if(seenChars.contains(currentChar)){
			break
		}else{
			subString = subString + String(currentChar)
			seenChars.insert(currentChar)
		}
	}

	return subString
}

//TESTS
var onlySingleCharacter = "AA"
var longestSubstringAtBeginning = "Hallo"
var longestSubstringAtEnd = "duiilloser"
var longestSubstringInMiddle = "dullHiolerret"
var wholeStringLongest = "abcdefGhHi"

var result = longestSubstring(of: onlySingleCharacter)
assert (result == "A", "Incorrect longest substring found \(result) in \(onlySingleCharacter)")

result = longestSubstring(of: longestSubstringAtBeginning)
assert (result == "Hal", "Incorrect longest substring found \(result) in \(longestSubstringAtBeginning)")

result = longestSubstring(of: longestSubstringAtEnd)
assert (result == "loser", "Incorrect longest substring found \(result) in \(longestSubstringAtEnd)")

result = longestSubstring(of: longestSubstringInMiddle)
assert (result == "Hioler", "Incorrect longest substring found \(result) in \(longestSubstringInMiddle)")

result = longestSubstring(of: wholeStringLongest)
assert (result == "abcdefGhHi", "Incorrect longest substring found \(result) in \(wholeStringLongest)")