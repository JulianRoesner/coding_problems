// Implementing radix sort for positive integers
import Foundation
func sort(array : [Int]) -> [Int]{

	//Find maximum to get the maximal number of digits
	var max = array[0]
	for i in 1..<array.count{
		if(array[i]>max){
			max = array[i]
		}
	}
	return radixSort(array: array, at: digits(from: max) - 1)
}

func digits(from: Int)->Int{
	var rest = from
	var count = 0
	while(rest > 0){
		rest = Int(rest/10)
		count += 1
	}

	return count
}

func radixSort(array : [Int], at : Int) -> [Int]{
	
	if(at < 0){
		return array
	}
	var buckets : [[Int]] = Array(repeating:Array(),count:10)


	//Sort point into bucket
	for elem in array{
		buckets[radix(from:elem, at:at)].append(elem)
	}

	//Sort every bucket
	for (index,bucket) in buckets.enumerated(){
		buckets[index] = radixSort(array:bucket, at:(at-1))
	}

	//Concatenate buckets
	var sortedArray : [Int] = Array(repeating: 0, count: array.count)
	var i = 0
	for bucket in buckets{
		for elem in bucket{
			sortedArray[i] = elem
			i += 1
		}
	}

	return sortedArray

}

func radix(from: Int, at: Int)->Int{
	let divident = Int(pow(Double(10), Double(at)))
	return Int(from/divident)%10
}

//TEST digits
var result = digits(from: 123)
assert(result == 3, "Stellen for 123 was not 3 but \(result) did not work")
result = digits(from: 1000)
assert(result == 4, "Stellen for 1000 was not 4 but \(result) did not work")
result = digits(from: 1)
assert(result == 1, "Stellen for 1 was not 1 but \(result) did not work")

//TEST radix
assert(radix(from: 123, at: 0) == 3, "Radix for 123 at 0 did not work")
assert(radix(from: 123, at: 1) == 2, "Radix for 123 at 1 did not work")
assert(radix(from: 123, at: 2) == 1, "Radix for 123 at 2 did not work")
//TESTS SORT
var sortArray = [200,4,1,12,3]
sortArray = sort(array: sortArray)
//Array got sorted in place
assert(sortArray[0] == 1, "First element is wrong \(sortArray)")
assert(sortArray[1] == 3, "Second element is wrong \(sortArray)")
assert(sortArray[2] == 4, "Third element is wrong \(sortArray)")
assert(sortArray[3] == 12, "Fourth element is wrong \(sortArray)")
assert(sortArray[4] == 200, "Fifth element is wrong \(sortArray)")

sortArray = [200,100,13,5,1]
sortArray = sort(array: sortArray)
//Array got sorted in place
assert(sortArray[0] == 1, "First element is wrong \(sortArray)")
assert(sortArray[1] == 5, "Second element is wrong: \(sortArray)")
assert(sortArray[2] == 13, "Third element is wrong \(sortArray)")
assert(sortArray[3] == 100, "Fourth element is wrong \(sortArray)")
assert(sortArray[4] == 200, "Fifth element is wrong \(sortArray)")

//Length stayed the same
assert(sortArray.count == 5)
