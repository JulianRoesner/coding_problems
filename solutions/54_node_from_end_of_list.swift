//How to find the third node from end of a list
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

func nodeFromEnd(of: LinkedList, offset: Int) -> Node?{
	guard var searchNode = of.root else{
		return nil
	}

	var spaceBetweenPointers = 0
	var current = searchNode
	while let next = current.next {
		spaceBetweenPointers += 1
		current = next

		if spaceBetweenPointers >= offset{
			break
		}
	}

	while let next = current.next{
		current = next

		if(searchNode.next != nil){
			searchNode = searchNode.next!
		}//Could throw error for else
	}

	return searchNode
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
var foundNode1 = Node(value: 17, next: Node(value: 4, next: Node(value: 6, next: Node(value: 6, next: nil))))
var testList = LinkedList(root: Node(value: 17, next: Node(value: 2, next: foundNode1)))
var foundNode2 = Node(value: 4, next: Node(value: 6, next: nil))
var testList2 = LinkedList(root: Node(value: 17, next: Node(value: 2, next: foundNode2)))

var result = nodeFromEnd(of: testList, offset: 3)
assert(result === foundNode1, "Found incorrect Node at end of testList: \(result as Optional)")

result = nodeFromEnd(of: testList2, offset: 1)
assert(result === foundNode2, "Found incorrect Node at end of testList2: \(result as Optional)")
