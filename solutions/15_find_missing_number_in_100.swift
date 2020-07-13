//Find the missing number from 1 to 100
func findingOneMissingNumber(inArray: [Int], range: Int) -> Int{
	let expectedSum = (range/2) * (range + 1)

	var actualSum = 0
	for elem in inArray{
		actualSum += elem
	}
	return  expectedSum - actualSum
}


/* 	Using binary search to find missing number. This could be extended to search for more than one missing number
	by splitting the search according to the difference of expected and actual value at a given index.
	Say expected is 50, but actual is 48 -> search in lower half for two missing values.
	We would then have to keep track of number of missing values we look for.
		=> 	at expected value 25 we look for two missing values, but it is 24. 
			we then have to look for one value between 0 and 24 and one between 24 and 48
*/
func findingMissingNumberBinarySearch(inArray: [Int]) -> Int{

	//Sort array
	let sortedArray = sort(array: inArray)

	// Binary search
	let middle = (inArray.count)/2
	return binarySearchForMissingNumber(inArray: sortedArray, lookAt: middle, upperBoundary: inArray.count, lowerBoundary: 0)
}

func binarySearchForMissingNumber(inArray: [Int], lookAt: Int, upperBoundary : Int, lowerBoundary: Int)-> Int{
	var newLookAt : Int
	var shift : Int = 0
	var newUpperBoundary = upperBoundary
	var newLowerBoundary = lowerBoundary
	var returnValue : Int = -1

	if(lookAt == 0){
		if(inArray[lookAt] == lookAt ){
			//Error
			returnValue = -1
		}
	}else if(lookAt == inArray.count - 1){
		if(inArray[lookAt] == lookAt + 1){
			//Error
			returnValue = lookAt + 2
		}
	}else{

		if (inArray[lookAt] == lookAt + 1){
			newLookAt = ((upperBoundary - lookAt)/2 ) + lookAt
			shift = 1
			newLowerBoundary = lookAt
		}else{
			newLookAt = (lookAt - lowerBoundary)/2	+ lowerBoundary	
			shift = -1
			newUpperBoundary = lookAt
		}

		if( (lookAt - newLookAt) == 1 ){
			returnValue = lookAt + shift + 1
		}else{
			returnValue = binarySearchForMissingNumber(inArray: inArray, lookAt: newLookAt, upperBoundary: newUpperBoundary, lowerBoundary: newLowerBoundary)
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


//Create test data
var missing97 : [Int] = Array ()
for i in 1...100{
	if (i != 97){
		missing97.append(i)
	}
} 
var missing1 : [Int] = Array ()
for i in 2...100{
	missing1.append(i)
} 
var missing100 : [Int] = Array ()
for i in 1..<100{
	missing100.append(i)
} 

var missingIn50 : [Int] = Array ()
for i in 1...50{
	if (i != 47){
		missingIn50.append(i)
	}
} 

//Test OneMissingNumber
var result = findingOneMissingNumber(inArray: missing97, range:100)
assert(result == 97 , "97 not found. Found \(result) instead.")

result = findingOneMissingNumber(inArray: missing1, range:100)
assert(result == 1 , "1 not found. Found \(result) instead.")

result = findingOneMissingNumber(inArray: missing100, range:100)
assert(result == 100 , "100 not found. Found \(result) instead.")

result = findingOneMissingNumber(inArray: missingIn50, range:50)
assert(result == 47 , "47 not found. Found \(result) instead.")


// Test findingMissingNumberBinarySearch
result = findingMissingNumberBinarySearch(inArray: missing97)
assert(result == 97 , "97 not found. Found \(result) instead.")

result = findingMissingNumberBinarySearch(inArray: missing1)
assert(result == 1 , "1 not found. Found \(result) instead.")

result = findingMissingNumberBinarySearch(inArray: missing100)
assert(result == 100 , "100 not found. Found \(result) instead.")

result = findingMissingNumberBinarySearch(inArray: missingIn50)
assert(result == 47 , "47 not found. Found \(result) instead.")