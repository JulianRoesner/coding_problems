//Convert a decimal number to binary form
func decimalToBinary(_ number: Int)->[Int]{
	var binaryNumber : [Int] = Array()
	if number < 0 {
		binaryNumber.append(1)
	}else{
		binaryNumber.append(0)
	}

	var result = abs(number)
	var rest : Int

	guard result > 0 else{
		binaryNumber.append(0)
		return binaryNumber
	}
	
	while(result > 0){
		rest = result % 2
		result = Int(result / 2)
		binaryNumber.append(rest)
	}

	var i = 1
	var j = binaryNumber.count - 1
	while(i < j){
		let temp = binaryNumber[i]
		binaryNumber[i] = binaryNumber[j]
		binaryNumber[j] = temp 
		i += 1
		j -= 1
	}

	return binaryNumber
}


//Tests
var zero = [0,0]
var negativeNumber = [1,1,1,0,0]
var positiveNumber = [0,1,1,0,0]
var oddNumber = [0,1,1,0,1]
var negativeNumberOddNumber = [1,1,1,0,1]

var result = decimalToBinary(0)
assert(result == zero, "Got wrong result: \(result) instead of \(zero)")

result = decimalToBinary(-12)
assert(result == negativeNumber, "Got wrong result: \(result) instead of \(negativeNumber)")

result = decimalToBinary(12)
assert(result == positiveNumber, "Got wrong result: \(result) instead of \(positiveNumber)")

result = decimalToBinary(13)
assert(result == oddNumber, "Got wrong result: \(result) instead of \(oddNumber)")

result = decimalToBinary(-13)
assert(result == negativeNumberOddNumber, "Got wrong result: \(result) instead of \(negativeNumberOddNumber)")