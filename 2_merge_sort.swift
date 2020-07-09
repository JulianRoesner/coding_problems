//Implementation of merge sort
func sort(array: [Int]) -> [Int]{
	var newArray : [Int]
	if(array.count<2){
		return array;
	}else{
		let pivot = array.count/2
		var leftArray = sort(array: Array(array[..<pivot]))
		var rightArray = sort(array: Array(array[pivot...]))
		newArray = Array(repeating: 0 , count: (leftArray.count + rightArray.count))
		var leftIndex = 0;
		var rightIndex = 0;
		for (index,_) in newArray.enumerated(){
			if(rightIndex >= rightArray.count || leftIndex < leftArray.count && leftArray[leftIndex]<rightArray[rightIndex]){
				newArray[index] = leftArray[leftIndex];
				leftIndex+=1;
			}else{
				newArray[index] = rightArray[rightIndex];
				rightIndex+=1;
			}
		}
	}
	return newArray;
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