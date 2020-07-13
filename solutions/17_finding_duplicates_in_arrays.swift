//Find a duplicate in an array(16) or more than one duplicate in an array (17)
func findDuplicates(inArray : [Int]) -> [Int]{
	var counts : [Int:Int] = [:]

	//Count elements
	for elem in inArray{
		if let count = counts[elem]{
			counts[elem]! += 1
		}else{
			counts[elem] = 1
		}

	var foundDuplicates : [Int] = Array()
	for elem in inArray{
		if let count = counts[elem] {
			if (count > 1 && foundDuplicates.filter{$0 == elem}.count == 0){
				foundDuplicates.append(elem)
			}
		}
	}

	return foundDuplicates

}


var noDuplicates = [7,5,2,1,8,9,0]
var oneDuplicat = [7,2,1,6,2,8]
var duplicates = [7,0,2,8,8,9,0,4,15,0,27]

var result = findDuplicates(inArray: noDuplicates)
assert( result == [], "Found duplicates in array with no duplicates \(result)")

result = findDuplicates(inArray: oneDuplicat)
assert( result == [2], "Found wrong duplicate instead of 2 \(result)")

result = findDuplicates(inArray: duplicates)
assert( result == [0,8], "Found wrong duplicate instead of 0 and 8 \(result)")