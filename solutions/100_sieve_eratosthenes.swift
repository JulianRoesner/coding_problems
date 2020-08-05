//Implement sieve of eratosthenes
func findPrimes(of: Int)->[Int]{
	guard of > 2 else{
		if(of == 2){
			return [2]
		}
		return []
	}
	var possiblePrimes : [Int] = Array()
	for i in 3...of{
		possiblePrimes.append(i)
	}

	var primes : [Int] = Array()
	primes.append(2)
	for potentialPrime in possiblePrimes{
		var isPrime = true
		for prime in primes{
			if potentialPrime % prime == 0{
				isPrime = false
			}
		}
		if isPrime{
			primes.append(potentialPrime)
		}
	}

	return primes


}

//Test eratosthenesSieve
var primesSmaller2 : [Int] = []
var primesUpTo2 = [2]
var primesUpTo30 = [2,3,5,7,11,13,17,19,23,29]

var result = findPrimes(of: 1)
assert(result == primesSmaller2, "Found incorrect primes for 1: \(result) instead of \(primesSmaller2)")

result = findPrimes(of: 2)
assert(result == primesUpTo2, "Found incorrect primes for 2: \(result) instead of \(primesUpTo2)")

result = findPrimes(of: 30)
assert(result == primesUpTo30, "Found incorrect primes for 30: \(result) instead of \(primesUpTo30)")
