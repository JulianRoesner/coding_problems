//Implementation of bucket sort
func sort(array : [Int]) -> [Int]{
	var newArray = array

	//Find number boundaries
	var max = array[0]
	var min = array[0]
	for elem in array{
		if(elem > max){
			max = elem
		}
		if(elem < min){
			min = elem
		}
	}
	let step = (max - min) / 5

	//Create buckets
	var buckets : [[Int]] = Array(repeating: Array(), count: 5)

	//Distribute array into buckets
	for elem in array{
		if(elem < min + 1 * step){
			buckets[0].append(elem)
		}
		else if (elem < min + 2 * step){
			buckets[1].append(elem)
		}
		else if (elem < min + 3 * step){
			buckets[2].append(elem)
		}
		else if (elem < min + 4 * step){
			buckets[3].append(elem)
		}
		else {
			buckets[4].append(elem)
		}
	}
	//Sort the buckets
	for index in 0...4{
		buckets[index] = mergesort(array: buckets[index])
	}

	//Put buckets together
	var i = 0
	for bucket in buckets{
		for elem in bucket{
			newArray[i] = elem
			i += 1
		}
	}

	return newArray

}

func mergesort(array: [Int]) -> [Int]{
	var newArray : [Int]
	if(array.count<2){
		return array;
	}else{
		let pivot = array.count/2
		var leftArray = mergesort(array: Array(array[..<pivot]))
		var rightArray = mergesort(array: Array(array[pivot...]))
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