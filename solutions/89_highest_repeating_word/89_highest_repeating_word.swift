//Find the highest repeating word
import Foundation
func findHighestRepeatingWord(_ text: String)->String{
	var wordCounts : [String:Int] = [:]

	for foundWord in text.split(separator: " "){
		let word = String(foundWord) 
		if wordCounts[word] == nil{
			wordCounts[word] = 0
		}else{
			wordCounts[word] = wordCounts[word]! + 1
		}
	}

	let sortedWords = wordCounts.sorted(by: { (firstElement, secondElement) -> Bool in
    	return firstElement.value > secondElement.value
	})

	if  let foundWord = sortedWords.first {
		return foundWord.key
	}else{
		return ""
	}
}

func findHighestRepeatingWordFrom(file: String)->String{
	let documentDirPath : URL
	do{
		documentDirPath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
	} catch let error as NSError{
		print("Failed finding dirctory path, Error \(error.localizedDescription)")
		return ""
	}
	let filePath =  documentDirPath.appendingPathComponent(file)

	//Read everything into memory
	var readString = ""
    do {
        readString = try String(contentsOf: filePath)
    } catch let error as NSError {
        print("Failed reading from: \(filePath), Error: " + error.localizedDescription)
    }
	return findHighestRepeatingWord(readString)
}

//TESTS
var repeatWord = "word Word you and i are also just words word words Apple apple apples"
var oneWord = "word"

var result = findHighestRepeatingWord(repeatWord)
assert(result == "word", "Found incorrect highest repeating word \(result)")

result = findHighestRepeatingWord(oneWord)
assert(result == "word", "Found incorrect highest repeating word \(result)")

//Test with text read from file
result = findHighestRepeatingWordFrom(file: "test.txt")
assert(result == "word", "Found incorrect highest repeating word in file \(result)")