//Get all permutations of a string
func getPermutations(of: String)->[String]{
	var result : [String] = Array()
	if (of.count <= 1){
		result.append(of)
		return result
	}
	
	for (index,char) in of.enumerated(){
		var leftCharacters = of
		leftCharacters.remove(at: of.index(of.startIndex, offsetBy: index))

		let permutations = getPermutations(of: leftCharacters)
		for permu in permutations{
			result.append(String(char) + permu)	
		}
		
	}
	return result
}

//Test
var testString = "Hal"
var result = getPermutations(of: testString)

assert(result.count == 6, "Incorrect number of permutations. \(result.count) not 6")
assert(result.contains(testString), "Result does not contain string itself. \(result)")
assert(result.contains("Hla"), "Result does not contain 'Hla'. \(result)")
assert(result.contains("laH"), "Result does not contain 'laH'. \(result)")
assert(result.contains("lHa"), "Result does not contain 'lHa'. \(result)")
assert(result.contains("aHl"), "Result does not contain 'aHl'. \(result)")
assert(result.contains("alH"), "Result does not contain 'alH'. \(result)")