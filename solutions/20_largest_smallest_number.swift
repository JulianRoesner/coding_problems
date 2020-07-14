//How to find the largest and smallest number in an array
func findLargestAndSmallestNumber(inArray: [Int])->(Int,Int){
	var min = inArray[0]
	var max = inArray[0]

	for elem in inArray{
		if (elem < min){
			min = elem
		}
		if (elem > max){
			max = elem
		}
	}

	return (min,max)
}

//TESTS
var negativeValues = [-2,-17,-14, -200]
var mixedValues = [2,-17,14,-200]
var positiveValues = [2,17,14,200]
var zero = [0]

var result = findLargestAndSmallestNumber(inArray: negativeValues)
assert(result == (-200,-2), "Found incorrect numbers \(result) instead of (-200,-17)")

result = findLargestAndSmallestNumber(inArray: mixedValues)
assert(result == (-200,14), "Found incorrect numbers \(result) instead of (-200,14)")

result = findLargestAndSmallestNumber(inArray: positiveValues)
assert(result == (2,200), "Found incorrect numbers \(result) instead of (17,200)")

result = findLargestAndSmallestNumber(inArray: zero)
assert(result == (0,0), "Found incorrect numbers \(result) instead of (0,0)")