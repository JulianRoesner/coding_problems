//Implementation insertion sort
func sort(array:inout [Int]){
	
	for i in 1..<array.count {

		var j = i
		while j > 0{
			if array[j] < array[j-1]{
				swap(array: &array, atIndex: j, withIndex: j - 1)
			}else{
				break
			}
			j -= 1
		} 
	}
}

func swap(array: inout [Int], atIndex: Int, withIndex: Int){
	var temp: Int;

	temp = array[atIndex]
	array[atIndex] = array[withIndex]
	array[withIndex] = temp
}



//TESTS SWAP
var swapArray = [2,3,6,7]

swap(array: &swapArray, atIndex: 0, withIndex: 3)
assert(swapArray[0] == 7, "First element was not correctly swapped \(swapArray)")
assert(swapArray[3] == 2, "Fourth element was not correctly swapped \(swapArray)")


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