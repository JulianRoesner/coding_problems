//Check, if two rectangles overlap each other
struct Rectangle{
	var x = 0
	var y = 0
	var width = 0
	var height = 0
}

func overlap(of : Rectangle, with: Rectangle) -> Bool{

	if( with.x >= of.x && with.x < (of.x + of.width)){
		if( with.y >= of.y && with.y < (of.y + of.height)){
			return true
		}
	}

	if( of.x >= with.x && of.x < (with.x + with.width)){
		if( of.y >= with.y && of.y < (with.y + with.height)){
			return true
		}
	}	
	return false
}

//TEST overlap
var a = Rectangle(x:0,y:0,width:10,height:10)
var inA = Rectangle(x:1,y:1,width:5,height:5)
var outsideA = Rectangle(x:20,y:20,width:5,height:5)
var overlapA = Rectangle(x:9,y:9,width:10,height:10)
var tangensA = Rectangle(x:10,y:10,width:10,height:10)

var result = overlap(of: a, with: inA)
assert(result == true, "Incorrect overlap of \(a) with \(inA) : \(result)")

result = overlap(of: a, with: outsideA)
assert(result == false, "Incorrect overlap of \(a) with \(outsideA) : \(result)")

result = overlap(of: a, with: overlapA)
assert(result == true, "Incorrect overlap of \(a) with \(overlapA) : \(result)")

result = overlap(of: a, with: tangensA)
assert(result == false, "Incorrect overlap of \(a) with \(tangensA) : \(result)")