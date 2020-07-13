//Find a duplicate in an array, return -1 if nothing was Found
func findDuplicate(inArray: [Int])->Int{
	var sortedArray = sort(array: inArray)
	var returnValue = -1
	for i in 0..<(sortedArray.count-1){
		if(sortedArray[i] == sortedArray[i+1]){
			returnValue = sortedArray[i]
		}
	}
	return returnValue
}


//Mergesort taken from solution to problem 2
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

// TESTS
var noDuplicates = [7,5,2,1,8,9,0]
var oneDuplicat = [7,2,1,6,2,8]
var duplicates = [7,0,2,8,8,9,0,4,15,0,27]

var result = findDuplicate(inArray: noDuplicates)
assert( result == -1, "Found duplicates in array with no duplicates \(result)")

result = findDuplicate(inArray: oneDuplicat)
assert( result == 2, "Found wrong duplicate instead of 2 \(result)")

result = findDuplicate(inArray: duplicates)
assert( result == 8, "Found wrong duplicate instead of 8 \(result)")