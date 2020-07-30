//Pascals triangle
func getPascalsTriangle(rows: Int)->String{
	guard rows > 0 else{
		return ""
	}

	guard rows > 1 else{
		return "1"
	}

	let MaxumberOfElements = rows * 2 - 1
	var result : String = ""
	var lastRow : [Int] = Array()
	for row in 1...rows{
		let sorroundingSpace = (MaxumberOfElements - (row * 2 - 1))/2
		var thisRow : [Int] = Array()
		result += String(repeating: " ", count:sorroundingSpace)
		for i in 0..<row{
			var parentA = 0
			var parentB = 0
			var count : Int
			if row == 1{
				count = 1
			}else{
				if i > 0{
				parentA = lastRow[i-1]
				}
				if i < lastRow.count{
					parentB = lastRow[i]
				}
				count = parentA + parentB
			}
			
			
			
			
			result += String(count) + " "
			thisRow.append(count)
		}

		if sorroundingSpace - 1 > 0{
			result += String(repeating: " ", count:sorroundingSpace - 1) + "\n"
		}else{
			result += String(repeating: " ", count:0 ) + "\n"
		}
		

		lastRow = thisRow
		thisRow = Array()
	}

	return result
}
//TESTS
var pascalstriangleFor1Row = "1"
var pascalstriangleFor2Rows = " 1 \n1 1 \n"
var pascalstriangleFor3Rows = "  1  \n 1 1 \n1 2 1 \n"
var pascalstriangleFor6Rows = "     1     \n    1 1    \n   1 2 1   \n  1 3 3 1  \n 1 4 6 4 1 \n1 5 10 10 5 1 \n"
var notATriangle = ""

var result = getPascalsTriangle(rows: 1)
assert(result == pascalstriangleFor1Row, "Incorrect triangle for 1 row; got:\n\(result)")

result = getPascalsTriangle(rows: 2)
assert(result == pascalstriangleFor2Rows, "Incorrect triangle for 2 rows; got:\n\(result)")

result = getPascalsTriangle(rows: 3)
assert(result == pascalstriangleFor3Rows, "Incorrect triangle for 3 rows; got:\n\(result)")

result = getPascalsTriangle(rows: 6)
assert(result == pascalstriangleFor6Rows, "Incorrect triangle for 6 rows; got:\n\(result)")

result = getPascalsTriangle(rows: -1)
assert(result == notATriangle, "Incorrect triangle for -1; got:\n\(result)")