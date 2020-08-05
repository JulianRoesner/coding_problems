//Insertion sort
func sort(array: inout [Int]){
	var i = 0

	while(i < array.count){
		var j = i 
		while(j>0){
			if(array[j] < array[j-1]){
				let temp = array[j]
				array[j] = array[j-1]
				array[j-1] = temp
			}else{
				break
			}
			j -= 1
		}

		i += 1
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