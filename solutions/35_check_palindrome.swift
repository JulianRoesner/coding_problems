//Check if a given string is a palindrome
func isPalindrome(this: String)-> Bool{
	for i in 0..<this.count/2{
		if(this[this.index(this.startIndex, offsetBy: i)] != this[this.index(this.endIndex, offsetBy: -1 - i )]){
			return false
		}
	}

	return true
}

//TESTS
var palindrome = "hannah"
var palindrome1 = "hanxnah"
var noPalindrome1 = "hannxh"
var noPalindrome2 = "hannxh"
var noPalindrome3 = "hannaH"

assert(isPalindrome(this:palindrome), "\(palindrome) incorrectly found no palindrome")
assert(isPalindrome(this:palindrome1), "\(palindrome1) incorrectly found no palindrome")
assert(isPalindrome(this:noPalindrome1) != true, "\(noPalindrome1) incorrectly found a palindrome")
assert(isPalindrome(this:noPalindrome2) != true, "\(noPalindrome2) incorrectly found a palindrome")
assert(isPalindrome(this:noPalindrome3) != true, "\(noPalindrome3) incorrectly found a palindrome")