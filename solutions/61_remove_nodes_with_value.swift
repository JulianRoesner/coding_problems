//Remove all nodes from a linked list, that have a certain value
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

func remove(value: Int, inList: inout LinkedList){
	guard var root = inList.root else{
		return
	}

	while(root.value == value && root.next != nil){
		inList.root = root.next
		root = root.next!
	}

	guard let nextNode = root.next else{
		if(root.value == value){
			inList.root = nil
		}
		return
	}

	remove(value: value, lastNode: root, nextNode: nextNode)
}

func remove(value: Int, lastNode: Node, nextNode: Node?){
	
	guard let next = nextNode else{
		return
	}

	if next.value == value {
		lastNode.next = next.next
		remove(value: value, lastNode: lastNode, nextNode: next.next)
	}else{
		remove(value: value, lastNode: next, nextNode: next.next)
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
var testList = LinkedList(root: Node(value: 1, next: Node(value: 1, next: Node(value: 1, next: Node(value: 4, next: Node(value: 6, next: Node(value: 1, next: nil)))))))
var onesRemoved = LinkedList(root: Node(value: 4, next: Node(value:6, next: nil)))

remove(value: 1, inList: &testList)
assert(compare(this:testList, withThis: onesRemoved), "Ones were not correctly removed \(testList)")

remove(value: 1, inList: &testList)
assert(compare(this:testList, withThis: onesRemoved), "List with no ones, ones were incorrectly removed \(testList)")

testList = LinkedList(root: nil)
remove(value: 1, inList: &testList)
assert(compare(this:testList, withThis: testList), "In empty list, ones were incorrectly removed \(testList)")