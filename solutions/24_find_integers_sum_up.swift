//Find all integers in an array, that sum up to a given number
func findSummands(inArray: [Int], sum: Int)-> Set<Int>{
	var possibleSummands : Set<Int> = []
	var summands : Set<Int> = []
	for elem in inArray{
		if possibleSummands.contains(sum - elem){
			summands.insert(sum - elem)
			summands.insert(elem)
		}
		possibleSummands.insert(elem)
	}

	return summands
}

//TESTs
var testArray = [1,3,12,17,2,2,-1,4,6]
var summands : Set<Int> = [1,4, 3,2, -1,6]

var result = findSummands(inArray: testArray, sum: 5)
assert(result == summands, "Incorrect summands found \(result)") 