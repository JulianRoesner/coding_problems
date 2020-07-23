//Check if two strings are a rotation of each other
func isRotation(this: String, ofThis: String) -> Bool{
	guard this.count == ofThis.count else{
		return false
	}

	for i in 0..<ofThis.count{
		if checkToEnd(this: this, withThis: ofThis, at : i) {
			return true
		}
	}
	return false
}

func checkToEnd(this: String, withThis: String, at: Int) -> Bool{
	var thisIndex = this.startIndex
	for i in at..<withThis.count{
		let withThisIndex = withThis.index(withThis.startIndex, offsetBy: i)
		if this[thisIndex] != withThis[withThisIndex] {
			return false
		}else{
			thisIndex = this.index(after: thisIndex)
		}
	}

	for i in 0..<at{
		let withThisIndex = withThis.index(withThis.startIndex, offsetBy: i)
		if this[thisIndex] != withThis[withThisIndex] {
			print("Huhu2")
			return false
		}else{
			thisIndex = this.index(after: thisIndex)
		}
	}

	return true
}


//TESTS
var testString = "skywalker"
var noRotation = "skywalKer"
var noRotation2 = "dkflksdöf"
var rotation = "kywalkers"

var result = isRotation(this: testString, ofThis: testString)
assert(result, "String of itself is not classified as a rotation")

result = isRotation(this: noRotation, ofThis: testString)
assert(result == false, "noRotation is classified as a rotation")

result = isRotation(this: noRotation2, ofThis: testString)
assert(result == false, "noRotation2 is classified as a rotation")

result = isRotation(this: rotation, ofThis: testString)
assert(result, "Rotation \(rotation) is not classified as a rotation")

testString = "laller"
rotation = "llerla"

result = isRotation(this: rotation, ofThis: testString)
assert(result, "Rotation \(rotation) is not classified as a rotation")