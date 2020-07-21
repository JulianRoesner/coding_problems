//Remove nth node from end of a linked list
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

func removeNode(inList: inout LinkedList, offsetFromEnd: Int){
	var counter = 0 

	guard var current = inList.root else{
		return
	} 
	var beforeRemove = current

	while let next = current.next{
		if (counter == offsetFromEnd){
			if let beforeRemoveNext = beforeRemove.next{ 		//Could throw an error otherwise
				beforeRemove = beforeRemoveNext
			}

			current = next
			
		}else{
			counter += 1
			current = next
		}
	}

	if (counter == offsetFromEnd){								//Could throw an error otherwise
		if let beforeRemoveNext = beforeRemove.next{
			beforeRemove.next = beforeRemoveNext.next
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

var testList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: nil)))))
var removedList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 4, next: nil))))

removeNode(inList: &testList, offsetFromEnd: 2)
assert(compare(this:testList, withThis: removedList), " 2nd to end was not removed \(testList)")

testList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: nil)))))
removedList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: nil))))

removeNode(inList: &testList, offsetFromEnd: 1)
assert(compare(this:testList, withThis: removedList), " Last to end was not removed \(testList)")
	
testList = LinkedList(root: nil)
removeNode(inList: &testList, offsetFromEnd: 3)
assert(compare(this:testList, withThis: testList), "Empty list was incorrect reversed \(testList)")