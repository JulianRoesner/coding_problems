//Implementation of an iterative quicksort
func sort(array:[Int])->[Int]{
	var boundaryStack : [(Int,Int)] = Array()

	var newArray = array
	
	boundaryStack.append((0 , array.count - 1))

	while(!boundaryStack.isEmpty){

		for (index, (lowerBoundary, upperBoundary)) in boundaryStack.enumerated(){
			let pivot = newArray[upperBoundary]
			var lowerArray : [Int] = Array()
			var upperArray : [Int] = Array()
			var pivotPlacement = lowerBoundary

			//Sort the
			for index in lowerBoundary..<upperBoundary{
				if (newArray[index] < pivot){
					lowerArray.append(newArray[index])
					pivotPlacement += 1
				}else{
					upperArray.append(newArray[index])
				}
			}


			//Concat the two arrays and set them to the array
			var i = lowerBoundary
			for elem in lowerArray{
					newArray[i] = elem
					i += 1
			} 

			//set pivot
			newArray[i] = pivot
			i += 1

			for elem in upperArray{
					newArray[i] = elem
					i += 1
			}

			

			//Delete these boundaries, because we have already used them
			boundaryStack.remove(at: index)

			//Calculate new boundaries twice, for both sides of the pivot
			var newLowerBoundary = lowerBoundary
			var newUpperBoundary = pivotPlacement - 1
			if(newLowerBoundary < newUpperBoundary){
				boundaryStack.append((newLowerBoundary, newUpperBoundary))
			}

			newLowerBoundary = pivotPlacement + 1
			newUpperBoundary = upperBoundary
			if(newLowerBoundary < newUpperBoundary){
				boundaryStack.append((newLowerBoundary, newUpperBoundary))
			}
		}
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