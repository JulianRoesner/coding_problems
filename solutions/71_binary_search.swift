//Perform binary search in an array
//It is assumed, that the array is sorted. If not, we would need to sort it before
//Returns correct index, if found, otherwise -1
func binarySearch(value: Int, here: [Int]) -> Int{
	guard here.count > 0 else{
		return -1
	}
	return binarySearchRec(value: value, here: here, lower: 0, upper: here.count)
}

func binarySearchRec(value: Int, here: [Int], lower: Int, upper: Int) -> Int{
	let at = Int((upper + lower )/2) 

	guard lower < upper else{
		if here[lower] == value{
			return lower
		}else{
			return -1
		}
	}
	
	if here[at] == value {
		return at
	}else if here[at] < value{
		return binarySearchRec(value: value, here: here, lower: at + 1, upper: upper )
	}else{
		return binarySearchRec(value: value, here: here, lower: lower, upper: at - 1)
	}
}


//TESTS
var testArray = [1,2,3,4,5,6,7,8,9,10,21,22,23,25,26,27,28,29,30,31]


var searchValue = 1
var correctIndex = 0
var result = binarySearch(value: searchValue, here: testArray)
assert(result == correctIndex, "Found an index looking for \(searchValue), was \(result), should have been \(correctIndex)")

searchValue = 7
correctIndex = 6
result = binarySearch(value: searchValue, here: testArray)
assert(result == correctIndex, "Found an index looking for \(searchValue), was \(result), should have been \(correctIndex)")

searchValue = 10
correctIndex = 9
result = binarySearch(value: searchValue, here: testArray)
assert(result == correctIndex, "Found an index looking for \(searchValue), was \(result), should have been \(correctIndex)")

searchValue = 31
correctIndex = testArray.count - 1
result = binarySearch(value: searchValue, here: testArray)
assert(result == correctIndex, "Found an index looking for \(searchValue), was \(result), should have been \(correctIndex)")

searchValue = 11
correctIndex = -1
result = binarySearch(value: searchValue, here: testArray)
assert(result == correctIndex, "Found an index looking for \(searchValue), was \(result), should have been \(correctIndex)")