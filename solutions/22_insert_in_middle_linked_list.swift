//Insert an element into the middle of a linked list
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

func insertAtMiddle(ofList: inout LinkedList, this: Node){
	if let root = ofList.root {
		var countOfElements = 1
		var current = root

		while let next = current.next{
			countOfElements += 1
			current = next
		}

		let middle = countOfElements / 2
		countOfElements = 1
		current = root
		while let next = current.next{
			if (countOfElements == middle){
				current.next = this
				this.next = next
			}
			current = next
			countOfElements += 1
		}		
	}else{
		ofList.root = this
	}

}

//TESTS
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
var listInserted = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 10, next: Node(value: 3, next: Node(value: 4, next: nil))))))

insertAtMiddle(ofList: &testList, this: Node(value : 10, next: nil))
assert(compare(this:testList, withThis: listInserted), "Element was not correctly inserted \(testList)")

testList = LinkedList(root: nil)
insertAtMiddle(ofList: &testList,  this: Node(value : 10, next: nil))
assert(compare(this:testList, withThis: LinkedList(root: Node(value: 10, next: nil))), "Empty list was incorrect inserted \(testList)")