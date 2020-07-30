//Check if a given number is a prime number
import Foundation
func isPrime(number: Int)-> Bool{
	guard number > 1 else{
		return false
	}

	var i = 2
	if number % 2 == 0{
		if number == 2 {
			return true
		}else{
			return false	
		}
		
	}

	i = 3

	while i <= Int(sqrt(Double(number))){
		if number % i == 0{
			return false
		}
		i += 2
	}

	return true
}


//Tests
var prime = 2
assert(isPrime(number: prime), "Not classified as prime \(prime)")

prime = 3
assert(isPrime(number: prime), "Not classified as prime \(prime)")

prime = 29
assert(isPrime(number: prime), "Not classified as prime \(prime)")

var notAPrime = 1
assert(!isPrime(number: notAPrime), "Classified as prime \(notAPrime)")

notAPrime = 4
assert(!isPrime(number: notAPrime), "Classified as prime \(notAPrime)")

notAPrime = 245
assert(!isPrime(number: notAPrime), "Classified as prime \(notAPrime)")