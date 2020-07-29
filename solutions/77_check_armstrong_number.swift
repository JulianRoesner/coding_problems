//Check if a number is an Amstrong number
import Foundation
func isArmstrong(_ number: Int)->Bool{
	guard number >= 0 else{
		return false
	}

	var digits : [Int] = Array()
	var rest : Int
	var result = number

	while(result > 0){
		rest = result % 10
		result = Int(result/10)
		digits.append(rest)
	}

	let exp = Double(digits.count)
	result = 0
	for digit in digits{
		result += Int(pow(Double(digit),exp)) 
	}
	return result == number

}
var onlyOneDigit = 0
var threeDigits = 153
var largeArmstrong = 93084
var noArmstrong = 13

assert(isArmstrong(onlyOneDigit), "onlyOneDigit was identified as no Armstrong number")
assert(isArmstrong(threeDigits), "twoDigits number was identified as no Armstrong number")
assert(isArmstrong(largeArmstrong), "largeArmstrong was identified as no Armstrong number")
assert(!isArmstrong(noArmstrong), "noArmstrong number was identified as a Armstrong number")