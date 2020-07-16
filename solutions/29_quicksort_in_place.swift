//Implementation of quicksort in place and recursive (Solution 19 is also in place)
func sort(array: inout [Int]){
	sort(array: &array, lowerBoundary: 0, upperBoundary: array.count - 1)
}

func sort(array: inout [Int], lowerBoundary: Int, upperBoundary: Int){
	if(lowerBoundary < upperBoundary){
		let pivot = array[upperBoundary]
		var j = lowerBoundary
		for i in lowerBoundary..<upperBoundary{
			if array[i] < pivot{
				let temp = array[i]
				array[i] = array[j]
				array[j] = temp
				j += 1
			}
		}
		array[upperBoundary] = array[j]
		array[j] = pivot

		sort(array: &array, lowerBoundary: lowerBoundary, upperBoundary: j - 1)
		sort(array: &array, lowerBoundary: j, upperBoundary: upperBoundary)

	}
}

//TESTS SORT
var sortArray = [200,4,1,12,3]
sort(array: &sortArray)
//Array got sorted in place
assert(sortArray[0] == 1, "First element is wrong \(sortArray)")
assert(sortArray[1] == 3, "Second element is wrong \(sortArray)")
assert(sortArray[2] == 4, "Third element is wrong \(sortArray)")
assert(sortArray[3] == 12, "Fourth element is wrong \(sortArray)")
assert(sortArray[4] == 200, "Fifth element is wrong \(sortArray)")

sortArray = [200,100,13,5,1]
sort(array: &sortArray)
//Array got sorted in place
assert(sortArray[0] == 1, "First element is wrong \(sortArray)")
assert(sortArray[1] == 5, "Second element is wrong: \(sortArray)")
assert(sortArray[2] == 13, "Third element is wrong \(sortArray)")
assert(sortArray[3] == 100, "Fourth element is wrong \(sortArray)")
assert(sortArray[4] == 200, "Fifth element is wrong \(sortArray)")

//Length stayed the same
assert(sortArray.count == 5)

//Negative values are also sorted
sortArray = [12,-4,1,-200,3]
sort(array: &sortArray)


assert(sortArray[0] == -200, "First element is wrong \(sortArray)")
assert(sortArray[1] == -4, "Second element is wrong \(sortArray)")
assert(sortArray[2] == 1, "Third element is wrong \(sortArray)")
assert(sortArray[3] == 3, "Fourth element is wrong \(sortArray)")
assert(sortArray[4] == 12, "Fifth element is wrong \(sortArray)")