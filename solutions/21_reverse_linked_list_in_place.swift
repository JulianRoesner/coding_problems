//Reverse a linked list in place
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


func reverseLinkedList(inList: inout LinkedList){

	// Catch empty lists
	if inList.root == nil{
		return
	}

	//Find new root 
	var newRoot = inList.root
	var beforeEnd = inList.root
	while let next = newRoot!.next{
		beforeEnd = newRoot
		newRoot = next
	}

	if (beforeEnd != nil){
		beforeEnd!.next = nil
	}

	if let foundRoot = newRoot{
		foundRoot.next = inList.root
		inList.root = foundRoot
	}

	var currentNode : Node? = inList.root 
	var nextNode = inList.root
	if let node = currentNode{
		nextNode = node.next
	}

	while let next = nextNode{

		if(next.next != nil){
			var lastNode = next
			var beforeLast = currentNode

			//find lastNode
			while let last = lastNode.next {
				beforeLast = lastNode
				lastNode = last
			}

			// Delete last node at the end and put it in between current and nex
			if (beforeLast != nil){
				beforeLast!.next = nil
			}			

			// Move last 
			lastNode.next = next

			
			lastNode.next = nextNode
			currentNode!.next = lastNode	
			currentNode = lastNode
			nextNode = currentNode!.next
			}else{
				nextNode = next.next
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
var reversedTestList = LinkedList(root: Node(value: 4, next: Node(value: 3, next: Node(value: 2, next: Node(value: 1, next: nil)))))

reverseLinkedList(inList: &testList)
assert(compare(this:testList, withThis: reversedTestList), "List was not reversed \(testList)")

testList = LinkedList(root: nil)
reverseLinkedList(inList: &testList)
assert(compare(this:testList, withThis: testList), "Empty list was incorrect reversed \(testList)")