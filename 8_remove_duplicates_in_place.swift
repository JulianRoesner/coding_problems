//Remove duplicates from an array in place
func removeDuplicates(from: inout[Int]){
	//Assess the limits of the range
	var min = from[0]
	var max = from[0]
	for elem in from{
		if(elem > max){
			max = elem
		}
		if(elem < min){
			min = elem
		}
	}
	var counts : [Int] = Array(repeating :  0, count : max-min+1)
	
	//Run through array and count occurrences
	for elem in from{
		counts[elem-min] += 1
	}
	var removeIndices : [Int] = Array()
	var difference = 0
	for (index,elem) in from.enumerated(){

		if(counts[elem-min]>1){
	
			removeIndices.append(index - difference)
			counts[elem-min] -= 1
			difference += 1
		}

	}

	for index in removeIndices{
		from.remove(at : index)
	}

	
}


//TESTS
var noDuplicates = [7,5,2,1,8,9,0]
var duplicates = [7,0,2,8,8,9,0,4,15,0,27]

removeDuplicates(from: &noDuplicates)
removeDuplicates(from: &duplicates)
assert( noDuplicates == [7,5,2,1,8,9,0], "Changed array with no duplicates \(noDuplicates)")
assert( duplicates == [7,2,8,9,4,15,0,27], "Changed array with duplicates incorrectly \(duplicates)")