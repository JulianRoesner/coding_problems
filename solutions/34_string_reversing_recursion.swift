//Reverse a string using recursion
func reverse(of: String) -> String{
	if (of.count <= 0){
		return of
	}
	return reverseRec(of: of, iteration: 0)
}

func reverseRec(of: String, iteration: Int)-> String{
	if(iteration >= of.count - 1){
		return String(of[of.index(of.endIndex, offsetBy: -1)])
	}

	return reverseRec(of: of, iteration: iteration + 1) + String(of[of.index(of.startIndex, offsetBy:(iteration))])
}

//TESTS
var empty = ""
var palindrome = "hannah"
var teststring = "abcdefg"

var result = reverse(of: empty)
assert(result == "", "Empty string was not correctly reversed \(result)")

result = reverse(of: palindrom)
assert(result == "hannah", "palindrom string was not correctly reversed \(result)")

result = reverse(of: teststring)
assert(result == "gfedcba", "teststring string was not correctly reversed \(result)")