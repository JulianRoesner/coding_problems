//Implement binary search without recursion
func binarySearch(_ array: [Int], searchValue: Int)-> Int{
	var lowerBound = 0
	var upperBound = array.count
	while(lowerBound < upperBound){
		let currentIndex = (lowerBound + upperBound)/2

		if array[currentIndex] == searchValue {
			return currentIndex
		}else if array[currentIndex] < searchValue{
			lowerBound = currentIndex + 1
		}else{
			upperBound = currentIndex - 1
		}
	}


	return -1
}


//TESTS
var noResult = [1,2,3,4,5,6,8,9,10,11]
var withResult = [1,2,3,4,5,6,7,8,9,10,11]

//Test notFound
var result = binarySearch(noResult, searchValue: 7)
assert(result == -1, "Found index \(result), while searching for 7, should have found -1")

//Test notFound at end
result = binarySearch(noResult, searchValue: 12)
assert(result == -1, "Found index \(result), while searching for 12, should have found -1")

//Test notFound at beginning
result = binarySearch(noResult, searchValue: 0)
assert(result == -1, "Found index \(result), while searching for 0, should have found -1")

//Test found middle
result = binarySearch(withResult, searchValue: 7)
assert(result == 6, "Found index \(result), while searching for 7, should have found 6")

//Test result at end
result = binarySearch(withResult, searchValue: 11)
assert(result == 10, "Found index \(result), while searching for 11, should have found 10")

//Test result at beginning
result = binarySearch(withResult, searchValue: 1)
assert(result == 0, "Found index \(result), while searching for 1, should have found 0")