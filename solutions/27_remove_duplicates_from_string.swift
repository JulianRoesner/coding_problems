//Remove duplicates from a string
func removeDuplicates(from: inout String){
	
	var offset = 0
	for (key,char) in from.enumerated(){
		
		if (from.filter{$0 == char}.count > 1){
			
			from.remove(at: from.index(from.startIndex, offsetBy: key - offset))
			offset += 1

		}
	}
}

//TESTS
var withNoDuplicates = "abcde"
var withDuplicates = "abba"

removeDuplicates(from: &withNoDuplicates)
removeDuplicates(from: &withDuplicates)
assert(withNoDuplicates == "abcde", "No duplicates was incorrectly changed to \(withNoDuplicates)")
assert(withDuplicates == "ba", "Duplicates was incorrectly changed to \(withDuplicates)")