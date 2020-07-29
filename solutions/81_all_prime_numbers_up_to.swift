//Find all the prime numbers up to a given number, using the sieve of eratosthenes
import Foundation
func allPrimes(upTo: Int)-> [Int]{
	guard upTo >= 2 else{
		return []
	}
	var potentialPrimes : [Int] = Array()
	for i in 2...upTo{
		potentialPrimes.append(i)
	}
	var primes : [Int] = Array()
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


//TESTS
var primesSmaller2 : [Int] = []
var primesUpTo2 = [2]
var primesUpTo30 = [2,3,5,7,11,13,17,19,23,29]

var result = allPrimes(upTo: 1)
assert(result == primesSmaller2, "Found incorrect primes for 1: \(result) instead of \(primesSmaller2)")

result = allPrimes(upTo: 2)
assert(result == primesUpTo2, "Found incorrect primes for 2: \(result) instead of \(primesUpTo2)")

result = allPrimes(upTo: 30)
assert(result == primesUpTo30, "Found incorrect primes for 30: \(result) instead of \(primesUpTo30)")