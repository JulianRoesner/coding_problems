//Implementation of bucket sort
func sort(array: [Int]) -> [Int]{
	var newArray : [Int] = Array(repeating : 0, count : array.count)
	//Assess the limits of the range
	var min = array[0]
	var max = array[0]
	for elem in array{
		if(elem > max){
			max = elem
		}
		if(elem < min){
			min = elem
		}
	}
	var counts : [Int] = Array(repeating :  0, count : max-min+1)
	
	//Count values, count at the index relative to the range of numbers
	for elem in array{
		counts[elem-min] += 1
	}

	//Sum the counts up
	var cumulative_counts = 0
	for index in 0..<counts.count{
		cumulative_counts += counts[index]
		counts[index] = cumulative_counts
	}


	//Sort values correctly into new array
	for elem in array{
		let index = counts[elem-min] - 1
		newArray[index] = elem 
		counts[elem-min] -= 1
	}

	return newArray
}

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

//Negative values are also sorted
sortArray = [12,-4,1,-200,3]
sortArray = sort(array: sortArray)


assert(sortArray[0] == -200, "First element is wrong \(sortArray)")
assert(sortArray[1] == -4, "Second element is wrong \(sortArray)")
assert(sortArray[2] == 1, "Third element is wrong \(sortArray)")
assert(sortArray[3] == 3, "Fourth element is wrong \(sortArray)")
assert(sortArray[4] == 12, "Fifth element is wrong \(sortArray)")