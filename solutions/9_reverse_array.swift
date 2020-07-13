//Reverse an array in place
func reverse(thisArray : inout[Int]){

	var last = thisArray.count-1
	var index = 0

	while(index<last){
		let temp = thisArray[index]

		//Swap elements
		thisArray[index] = thisArray[last]
		thisArray[last] = temp

		last -= 1
		index += 1
	}
}


//TESTS
var testArray = [5,4,3,2,1]
var negArray = [-5,-4,-3,-2,-1]
var emptyArray : [Int] = []
var mixedArray = [5,-4,3,2,1]
var evenArray = [4,3,2,1]

reverse(thisArray:&testArray)
assert(testArray == [1,2,3,4,5], "Das testArray wurde nicht korrekt reversed \(testArray)")

reverse(thisArray:&negArray)
assert(negArray == [-1,-2,-3,-4,-5], "Das negArray wurde nicht korrekt reversed \(negArray)")

reverse(thisArray:&emptyArray)
assert(emptyArray.count == 0, "Das emptyArray wurde nicht korrekt reversed \(emptyArray)")

reverse(thisArray:&mixedArray)
assert(mixedArray == [1,2,3,-4,5], "Das mixedArray wurde nicht korrekt reversed \(mixedArray)")

reverse(thisArray:&evenArray)
assert(evenArray == [1,2,3,4], "Das evenArray wurde nicht korrekt reversed \(evenArray)")