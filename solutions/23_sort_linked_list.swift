//Sort a linked list
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

func sort(list: inout LinkedList){
	if var root = list.root{
		var current = root
		var lastSortedElement : Node
		while current != lastSortedElement{
			while var next = current.next && next != lastSortedElement{
				if (current.value > next.value){
					current.next = next.next
					next.next = current
				}
			}
			lastSortedElement = current
			current = root	
		}
		
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
var testList = LinkedList(root: Node(value: 4, next: Node(value: 3, next: Node(value: 1, next: Node(value: 2, next: nil)))))
var sortedList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: nil)))))

sort(list: &testList)
assert(compare(this:testList, withThis: sortedList), "List was not correctly sorted \(testList)")

testList = LinkedList(root: nil)
sort(list: &testList)
assert(compare(this:testList, withThis: testList), "Empty list was incorrect sorted \(testList)")