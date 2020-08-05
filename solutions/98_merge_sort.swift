//Merge sort
func sort(array: [Int])->[Int]{
	guard array.count > 1 else{
		return array
	}

	let middle = array.count/2
	var lowerHalf = sort(array: Array(array[0..<middle]))
	var upperHalf = sort(array: Array(array[middle..<array.count]))

	var resultingArray: [Int] = Array()
	var i = 0
	var j = 0
	while(i < lowerHalf.count || j < upperHalf.count){
		if (i < lowerHalf.count && j < upperHalf.count){
			if(lowerHalf[i] <= upperHalf[j]){
				resultingArray.append(lowerHalf[i])
				i += 1
			}else{
				resultingArray.append(upperHalf[j])
				j += 1
			}	
		}else if(i < lowerHalf.count){
			resultingArray.append(lowerHalf[i])
			i += 1
		}else{
			resultingArray.append(upperHalf[j])
			j += 1
		}
		

	}

	 return resultingArray
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