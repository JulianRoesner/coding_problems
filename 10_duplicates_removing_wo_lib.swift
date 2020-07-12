//Removing duplicates from an array without any library
func removeDuplicates(from : [Int]) -> [Int]{
	var resultArray : [Int] = from
	//Count elements
	var counts : [Int:Int] = [:]
	for elem in from{
		if(counts[elem] != nil){
			counts[elem]! += 1
		}else{
			counts[elem] = 1
		}
	}

	//Remove all elements with count > 1
	var removingIndices : [Int] = Array()
	var difference = 0
	for (index,elem) in from.enumerated(){
		if let count = counts[elem]{
			if(count>1){
				removingIndices.append(index - difference)
				difference += 1
				counts[elem] = counts[elem]! - 1
			}
		}
	}

	for index in removingIndices{
		resultArray = removeElement(from:resultArray, at:index)
	}

	return resultArray
}

func removeElement(from : [Int], at : Int) -> [Int]{
	var result : [Int] = Array(repeating : 0, count : from.count-1)

	var i = 0
	for (index,elem) in from.enumerated(){
		if(index != at){
			result[i] = elem
			i += 1
		}
	}

	return result
}

//TESTS
//Test removeElement
var elements = [1,2,3,12,4]

var result = removeElement(from:elements, at: 3)
assert(result == [1,2,3,4], "Element was incorrectly removed \(result) from \(elements) at index 3")

//Test removing duplicates
var noDuplicates = [7,5,2,1,8,9,0]
var duplicates = [7,0,2,8,8,9,0,4,15,0,27]

result = removeDuplicates(from: noDuplicates)
assert( result == [7,5,2,1,8,9,0], "Changed array with no duplicates \(result) / \(noDuplicates)")
result = removeDuplicates(from: duplicates)
assert( result == [7,2,8,9,4,15,0,27], "Changed array with duplicates incorrectly \(result) / \(duplicates)")