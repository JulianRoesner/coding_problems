import Foundation

//Convert a String to an Int, like atoi
enum IntParsingError: Error {
    case invalidInput(Character)
}


func getIntValue(from : String) throws ->Int{

	var valueArr : [Int] = Array()
	var negative = false
	var fromString = from

	//Check for negative numbers, if it is get rid of "-"
	if(String(fromString.prefix(1)) == "-"){
		negative = true
		fromString = fromString.filter{$0 != "-"}
	}

	//Loop over String and get the numerical representations
	for charAsci in fromString.utf8{
		if(charAsci < 48 || charAsci > 57){
			throw IntParsingError.invalidInput(Character(UnicodeScalar(charAsci)))
		}else{
			valueArr.append(Int(charAsci) - 48);
		}
	}

	//Create number
	var value : Int = 0
	var exponent = valueArr.count - 1
	for number in valueArr{
		
		value += number * Int(pow(Double(10),Double(exponent)))
		exponent -= 1
	}
	if(negative){
		value *= -1
	}
	return value
}


//TESTS
var onePosNumber = "17"
var oneNegNumber = "-12"
var manyPosNumbers = "234"
var manyNegNumbers = "-234"
var notANumber = "123a"
var wrongCatchThrown = false;
var result : Int

do{

	result = try getIntValue(from: onePosNumber)
	assert(result == 17, "Wrong result \(result) from \(onePosNumber)")

	result = try getIntValue(from: oneNegNumber)
	assert(result == -12, "Wrong result \(result) from \(oneNegNumber)")

	result = try getIntValue(from: manyPosNumbers)
	assert(result == 234, "Wrong result \(result) from \(manyPosNumbers)")

	result = try getIntValue(from: manyNegNumbers)
	assert(result == -234, "Wrong result \(result) from \(manyNegNumbers)")
}catch{
	wrongCatchThrown = true;
}
assert(wrongCatchThrown == false, "Incorrect error was thrown")

//Test throws
var correctCatchThrown = false;
do{
	result = try getIntValue(from: notANumber)
}catch IntParsingError.invalidInput (_){
	correctCatchThrown = true
}catch{

}
assert(correctCatchThrown == true, "Not correct error was thrown for \(notANumber)")