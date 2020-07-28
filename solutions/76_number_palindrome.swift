//Check if a given number is a palindrome
func isPalindrome(_ number: Int )->Bool{
	
	var digits : [Int] = Array() 
	var result = abs(number)
	var rest = abs(number)
	let divisor = 10
	while(result > 0){
		rest = result % divisor
		result = Int(result/divisor)
		digits.append(rest)
	}
	var i = 0
	var j = digits.count - 1
	while (i<j){
		if digits[i] != digits[j]{
			return false
		}
		i += 1
		j -= 1
	}
	return true
}

//TESTS
var negativePalindrome = -12321
var positivePalindrome = 412343214
var onlyOneDigit = 1
var noPalindrome = 120304

assert(isPalindrome(negativePalindrome), "negativePalindrome was identified as no palindrome")
assert(isPalindrome(positivePalindrome), "positivePalindrome was identified as no palindrome")
assert(isPalindrome(onlyOneDigit), "onlyOneDigit was identified as no palindrome")
assert(!isPalindrome(noPalindrome), "noPalindrome was identified as a palindrome")