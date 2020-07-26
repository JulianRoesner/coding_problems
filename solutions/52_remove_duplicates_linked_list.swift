//Remove duplicates in a linked list (unsorted) using no recursion
import Swift 
class Node: CustomStringConvertible{
	var value : Int
	var next : Node? = nil

	init(value : Int, next: Node?){
		self.value = value
		if let node = next{
			self.next = node
		}
	}

	public var description: String { 
		return "(Node: \(value)) " 
	}

}


class LinkedList: CustomStringConvertible{
	var root : Node? = nil

	init(root: Node?){
		if let node = root{
			self.root = node
		}
	}

	public var description: String { 
		var descriptionText = "(LinkedList:  root \(root as Node?), "
		var node = root

		if node == nil{
			return descriptionText + ")"
		}else{
			while let current = node!.next{
				descriptionText += "\(current)"
				node = current
			}
			descriptionText += " ) " 

			return descriptionText
		}
		
	}
}

func removeDuplicates(inList: inout LinkedList){
	guard var last = inList.root else{
		return
	}

	var seenValues : Set<Int> = []
	seenValues.insert(last.value)

	while let current = last.next{
		if seenValues.contains(current.value){
			last.next = current.next
		}else{
			seenValues.insert(current.value)
			last = current
		}
	}
}

//Tests
func compare(this: LinkedList, withThis: LinkedList)->Bool{
	var thisCurrentValue = this.root
	var otherCurrentValue = withThis.root
	while(thisCurrentValue != nil && otherCurrentValue != nil){
		if (thisCurrentValue!.value != otherCurrentValue!.value){
			return false	
		}

		thisCurrentValue = thisCurrentValue!.next
		otherCurrentValue = otherCurrentValue!.next
	}

	if(thisCurrentValue == nil && otherCurrentValue == nil){
		return true
	}else{
		return false
	}
}
var testList = LinkedList(root: Node(value: 17, next: Node(value: 2, next: Node(value: 17, next: Node(value: 4, next: Node(value: 6, next: Node(value: 6, next: nil)))))))
var duplicatesRemoved = LinkedList(root: Node(value: 17, next: Node(value: 2, next: Node(value: 4, next: Node(value: 6, next: nil)))))

removeDuplicates(inList: &testList)
assert(compare(this:testList, withThis: duplicatesRemoved), "Duplicates were not correctly removed \(testList)")

removeDuplicates(inList: &testList)
assert(compare(this:testList, withThis: duplicatesRemoved), "List with no duplicates, duplicates were incorrectly removed \(testList)")

testList = LinkedList(root: nil)
removeDuplicates(inList: &testList)
assert(compare(this:testList, withThis: testList), "In empty list, duplicates were incorrectly removed \(testList)")