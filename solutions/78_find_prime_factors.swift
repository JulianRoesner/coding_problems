//Finding prime numbers for a given number
import Foundation
func eratosthenesSieve(of: Int)-> [Int]{
	guard of > 2 else{
		return []
	}
	var potentialPrimes : [Int] = Array()
	for i in 2...of{
		potentialPrimes.append(i)
	}
	var primes : [Int] = Array()
	primes.append(2)
	for potentialPrime in potentialPrimes{
		if primes.count > 0{
			var isPrime = true
			for prime in primes{
				if potentialPrime % prime == 0{
					isPrime = false
				}
			}
			if isPrime{
				primes.append(potentialPrime)
			}
		}else{
			primes.append(potentialPrime)
		}
	}

	return primes
}

func findPrimeFactors(of: Int)->[Int]{
	let potentialPrimeFactors = eratosthenesSieve(of: of)
	var rest = of
	var primeFactors : [Int] = Array() 
	for potentialPrime in potentialPrimeFactors{
		if rest % potentialPrime == 0{
			primeFactors.append(potentialPrime)
			rest = Int(rest/potentialPrime)
		}

		if rest == 1{
			break
		}
	}

	return primeFactors
}

//A more efficient way to find all the prime factors
func findPrimeFactorsEff(of: Int) ->[Int]{
	guard of >= 2 else{
		return []
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

	return primeFactors

}


//Test eratosthenesSieve
var primesSmaller2 : [Int] = []
var primesUpTo2 = [2]
var primesUpTo30 = [2,3,5,7,11,13,17,19,23,29]

var result = eratosthenesSieve(of: 1)
assert(result == primesSmaller2, "Found incorrect primes for 1: \(result) instead of \(primesSmaller2)")

result = eratosthenesSieve(of: 2)
assert(result == primesUpTo2, "Found incorrect primes for 2: \(result) instead of \(primesUpTo2)")

result = eratosthenesSieve(of: 30)
assert(result == primesUpTo30, "Found incorrect primes for 30: \(result) instead of \(primesUpTo30)")

//Test finding prime factors
var factorsOf1: [Int] = []
var factorsOfAPrime = [13]
var factorsOfNotAPrime = [2,3,5]

result = findPrimeFactors(of: 1)
assert(result == factorsOf1, "Found incorrect primes for 1: \(result) instead of \(factorsOf1)")

result = findPrimeFactors(of: 13)
assert(result == factorsOfAPrime, "Found incorrect primes for 13: \(result) instead of \(factorsOfAPrime)")

result = findPrimeFactors(of: 30)
assert(result == factorsOfNotAPrime, "Found incorrect primes for 30: \(result) instead of \(factorsOfNotAPrime)")


//Test finding prime factors efficient
result = findPrimeFactorsEff(of: 1)
assert(result == factorsOf1, "Found incorrect primes for 1: \(result) instead of \(factorsOf1)")

result = findPrimeFactorsEff(of: 13)
assert(result == factorsOfAPrime, "Found incorrect primes for 13: \(result) instead of \(factorsOfAPrime)")

result = findPrimeFactorsEff(of: 30)
assert(result == factorsOfNotAPrime, "Found incorrect primes for 30: \(result) instead of \(factorsOfNotAPrime)")