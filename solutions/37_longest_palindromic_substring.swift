//Find the longes palindromic substring
func longestPalindromicSubstring(of: String) -> String{
	var longestSubstring = ""

	for(index, _) in of.enumerated(){
		//get next substring
		let next = findNextSubstring(of: String(of.suffix(from:of.index(of.startIndex, offsetBy: index))))

		//Check length
		if (next.count > longestSubstring.count){
			longestSubstring = next
		}
	}

	return longestSubstring
}

func findNextSubstring(of: String) -> String{
	var nextSubstring = ""
	var nextPalindrome = ""
	for char in of{
		if (isPalindrome(this: (nextSubstring + String(char)))){
			nextPalindrome = nextSubstring + String(char)
			nextSubstring = nextPalindrome
		}else{
			nextSubstring = nextSubstring + String(char)
		}
	}

	return nextPalindrome
}

func isPalindrome(this: String) -> Bool{

	let reversed = reverse(this: this)
	return reversed == this
}

func reverse(this: String) -> String{

	if(this.count <= 1){
		return this
	}else{
		let restOfString = String(this.suffix(from: this.index(this.startIndex, offsetBy: 1)))
		return reverse(this: restOfString) + String(this[this.startIndex])
	}
}

//TESTS
var onlySingleCharacter = "A"
var longestSubstringAtBeginning = "annaalla"
var longestSubstringAtEnd = "Halla"
var longestSubstringInMiddle = "dullarrat"
var wholeStringLongest = "lodioidol"

var result = longestPalindromicSubstring(of: onlySingleCharacter)
assert (result == "A", "Incorrect longest substring found \(result) in \(onlySingleCharacter)")

result = longestPalindromicSubstring(of: longestSubstringAtBeginning)
assert (result == "anna", "Incorrect longest substring found \(result) in \(longestSubstringAtBeginning)")

result = longestPalindromicSubstring(of: longestSubstringAtEnd)
assert (result == "alla", "Incorrect longest substring found \(result) in \(longestSubstringAtEnd)")

result = longestPalindromicSubstring(of: longestSubstringInMiddle)
assert (result == "arra", "Incorrect longest substring found \(result) in \(longestSubstringInMiddle)")

result = longestPalindromicSubstring(of: wholeStringLongest)
assert (result == "lodioidol", "Incorrect longest substring found \(result) in \(wholeStringLongest)")