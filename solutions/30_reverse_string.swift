//Reverse a string in place
func reverse(thisString: inout String){
	if(thisString.count != 0){
		var fromFront = thisString.startIndex
		var fromEnd = thisString.index(thisString.endIndex, offsetBy: -1)

		while(fromFront<fromEnd){
			let temp = thisString[fromFront]
			thisString.replaceSubrange(fromFront..<thisString.index(fromFront, offsetBy: 1), with: [thisString[fromEnd]])
			thisString.replaceSubrange(fromEnd..<thisString.index(fromEnd, offsetBy: 1), with: [temp])

			fromFront = thisString.index(fromFront, offsetBy: 1)
			fromEnd = thisString.index(fromEnd, offsetBy: -1)
		}
	}
	

}

//TESTS
var empty = ""
var palindrome = "hannah"
var teststring = "abcdefg"

reverse(thisString: &empty)
assert(empty == "", "Empty string was not correctly reversed \(empty)")

reverse(thisString: &palindrome)
assert(palindrome == "hannah", "palindrom string was not correctly reversed \(palindrome)")

reverse(thisString: &teststring)
assert(teststring == "gfedcba", "teststring string was not correctly reversed \(teststring)")