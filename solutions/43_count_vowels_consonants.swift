//Count number of vowels and consonants in a string
func countVowelsConsonants(inString: String) -> (Int, Int){
	let vowels : Set<Character> = ["a", "e", "i", "o", "u"]
	let consonants : Set<Character> = ["b", "c", "d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z",]
	var numberVowels = 0
	var numberConsonants = 0

	for char in inString.lowercased(){
		if vowels.contains(char){
			numberVowels += 1
		}

		if consonants.contains(char){
			numberConsonants += 1
		}
	}

	return (numberVowels, numberConsonants)
}	


//Tests
var firstString = "Bilado"
var emptyString = ""

var (numberVow, numberCons) = countVowelsConsonants(inString: firstString)
assert(numberVow == 3, "Not correct number of vows \(numberVow) counted in \(firstString)" )
assert(numberCons == 3, "Not correct number of vows \(numberCons) counted in \(firstString)" )


(numberVow, numberCons) = countVowelsConsonants(inString: emptyString)
assert(numberVow == 0, "Not correct number of vows \(numberVow) counted in emptyString" )
assert(numberCons == 0, "Not correct number of vows \(numberCons) counted in emptyString" )