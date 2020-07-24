//Reverse a linked list
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

func reverse(inList: inout LinkedList){
	guard let root = inList.root else{
		return
	}

	inList.root = reverse(inNode: root)
}

func reverse(inNode: Node) -> Node{
	guard let next = inNode.next else{
		return inNode
	}

	inNode.next = nil

	return reverse(inNode: next, lastNode: inNode)

}

func reverse(inNode: Node, lastNode: Node) -> Node{
	guard let next = inNode.next else{
		inNode.next = lastNode
		return inNode
	}

	inNode.next = lastNode

	return reverse(inNode: next, lastNode: inNode)
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
var reversedTestList = LinkedList(root: Node(value: 4, next: Node(value: 3, next: Node(value: 2, next: Node(value: 1, next: nil)))))

reverse(inList: &testList)
assert(compare(this:testList, withThis: reversedTestList), "List was not reversed \(testList)")

testList = LinkedList(root: nil)
reverse(inList: &testList)
assert(compare(this:testList, withThis: testList), "Empty list was incorrect reversed \(testList)")