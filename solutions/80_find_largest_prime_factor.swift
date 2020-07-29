//Find largest prime factor of a given number
import Foundation
func findLargestPrimeFactors(of: Int) ->Int{
	guard of >= 2 else{
		return -1
	}
	var rest = of
	var primeFactors : [Int] = Array()
	if of % 2 == 0{
		rest = Int(rest/2)
		primeFactors.append(2)
	}

	var divisor = 3
	while(divisor <= Int(sqrt(Double(of)))){
		if rest % divisor == 0{
			rest = Int(rest/divisor)
			primeFactors.append(divisor)
		}

		divisor += 2
	}

	if(primeFactors.count < 1){
		primeFactors.append(of)
	}
	if let result = primeFactors.popLast(){
		return result
	}else{
		return -1
	}
}


//TESTS
var largestFactorFor1 = -1
var largestFactorFor2 = 2
var largestFactorForPrime = 13
var largestFactorForNoPrime = 5

var result = findLargestPrimeFactors(of: 1)
assert(result == largestFactorFor1, "Found incorrect prime for 1: \(result) instead of \(largestFactorFor1)")

result = findLargestPrimeFactors(of: 2)
assert(result == largestFactorFor2, "Found incorrect prime for 2: \(result) instead of \(largestFactorFor2)")

result = findLargestPrimeFactors(of: 13)
assert(result == largestFactorForPrime, "Found incorrect prime for 13: \(result) instead of \(largestFactorForPrime)")

result = findLargestPrimeFactors(of: 40)
assert(result == largestFactorForNoPrime, "Found incorrect prime for 40: \(result) instead of \(largestFactorForNoPrime)")