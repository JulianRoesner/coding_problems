//See solutions to 8 or 10 for other solutions
func removeDuplicates(from: inout [Int]){
	var noDuplicates : Set<Int> = []
	for elem in from{
		noDuplicates.insert(elem)
		
	}

	//Delete all and then put elements from set back in
	from = []
	for elem in noDuplicates.sorted(){	//We need to sort to get a predictable result
		from.append(elem)
	}
}

//TESTS
var noDuplicates = [7,5,2,1,8,9,0]
var duplicates = [7,0,2,8,8,9,0,4,15,0,27]

removeDuplicates(from: &noDuplicates)
removeDuplicates(from: &duplicates)
assert( noDuplicates == [0,1,2,5,7,8,9], "Changed array with no duplicates \(noDuplicates)")
assert( duplicates == [0,2,4,7,8,9,15,27], "Changed array with duplicates incorrectly \(duplicates)")