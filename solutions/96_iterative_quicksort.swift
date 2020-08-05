//Implementation iterative quicksort
func sort(array: inout [Int]){
	var stack: [(Int,Int)] = Array()

	stack.append((0, array.count-1))
	
	while (!stack.isEmpty){
		let (begin, end) = stack.popLast()!
		if(begin <= end - 1){
			let pivot = array[end]
			var lower: [Int] = Array()
			var upper: [Int] = Array()
			
			for i in begin..<end{
				if(array[i] < pivot){
					lower.append(array[i])
				}else{
					upper.append(array[i])
				}
			}
			var i = begin
			var j = 0
			while(j < lower.count){
				if j < lower.count{
					array[i] = lower[j]
					j += 1
					i += 1
				}
			}
			let middle = i
			array[i] = pivot
			i += 1

			j = 0
			while(j < upper.count){
				if j < upper.count{
					array[i] = upper[j]
					j += 1
					i += 1
				}
			}
			stack.append((begin, middle - 1))
			stack.append((middle + 1, end))
		}
	}
}



//TESTS SORT
var sortArray = [200,4,1,12,3]
sort(array: &sortArray)
//Array got sorted in place
assert(sortArray[0] == 1, "First element is wrong \(sortArray)")
assert(sortArray[1] == 3, "Second element is wrong \(sortArray)")
assert(sortArray[2] == 4, "Third element is wrong \(sortArray)")
assert(sortArray[3] == 12, "Fourth element is wrong \(sortArray)")
assert(sortArray[4] == 200, "Fifth element is wrong \(sortArray)")

sortArray = [200,100,13,5,1]
sort(array: &sortArray)
//Array got sorted in place
assert(sortArray[0] == 1, "First element is wrong \(sortArray)")
assert(sortArray[1] == 5, "Second element is wrong: \(sortArray)")
assert(sortArray[2] == 13, "Third element is wrong \(sortArray)")
assert(sortArray[3] == 100, "Fourth element is wrong \(sortArray)")
assert(sortArray[4] == 200, "Fifth element is wrong \(sortArray)")

//Length stayed the same
assert(sortArray.count == 5)

//Negative values are also sorted
sortArray = [12,-4,1,-200,3]
sort(array: &sortArray)


assert(sortArray[0] == -200, "First element is wrong \(sortArray)")
assert(sortArray[1] == -4, "Second element is wrong \(sortArray)")
assert(sortArray[2] == 1, "Third element is wrong \(sortArray)")
assert(sortArray[3] == 3, "Fourth element is wrong \(sortArray)")
assert(sortArray[4] == 12, "Fifth element is wrong \(sortArray)")