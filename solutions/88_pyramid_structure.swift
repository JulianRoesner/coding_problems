//Print a pyramid structure for a certain number of levels
func getPyramid(_ levels: Int) -> String{
	guard levels > 0 else{
		return ""
	}
	var result = ""
	for level in 1...levels{
		result += String("x ", count: level)
		result += "\n"
	}

	return result
}
//TESTS
var pyramidForOne = "* \n"
var pyramidForTwo = "* \n* * \n"
var pyramidForThree = "* \n* * \n* * * \n"

var result = getPyramid(1)
assert(result == pyramidForOne, "Found incorrect pyramid:\n\(result) instead of \n\(pyramidForOne)")

result = getPyramid(2)
assert(result == pyramidForTwo, "Found incorrect pyramid:\n\(result) instead of \n\(pyramidForTwo)")

result = getPyramid(3)
assert(result == pyramidForThree, "Found incorrect pyramid:\n\(result) instead of \n\(pyramidForThree)")

result = getPyramid(-1)
assert(result == pyramidForThree, "Found incorrect pyramid:\n\(result) instead of \n\(pyramidForThree)")