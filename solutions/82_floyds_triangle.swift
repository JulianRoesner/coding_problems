//Get floyds triangle
func floydstriangle(to: Int, from: Int = 1)->String{
	guard from < to && from > 0 && to > 0 else{
		return ""
	}
	var result : String = ""
	var i = 1
	var limit = 1

	for count in from...to{
		result +=   String(count) + " "
		if(i < limit ){	
			i += 1
		}else{
			result += "\n"
			limit += 1
			i = 1
		}
	}

	return result

}


//TESTS
var floydTriangle1to9 = "1 \n2 3 \n4 5 6 \n7 8 9 "
var floydTriangle5To12 = "5 \n6 7 \n8 9 10 \n11 12 "
var floydstriangle1To3 = "1 \n2 3 \n"
var notATriangle = ""

var result = floydstriangle( to: 9,from: 1)
assert(result == floydTriangle1to9, "Incorrect triangle for 1 to 9; got:\n\(result)")

result = floydstriangle( to: 12,from: 5)
assert(result == floydTriangle5To12, "Incorrect triangle for 5 to 12; got:\n\(result)")

result = floydstriangle(to: 3)
assert(result == floydstriangle1To3, "Incorrect triangle up to3; got:\n\(result)")

result = floydstriangle( to: 12,from: -5)
assert(result == notATriangle, "Incorrect triangle for -5 to 12; got:\n\(result)")