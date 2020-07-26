//Partition a list in such a way, that all values < x come before x
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

func partition(list: LinkedList, before: Int) -> LinkedList{
	guard let root = list.root else{
		return list
	}
	var beforeX : Node = Node(value: 10, next: nil)
	var afterX : Node = Node(value: 10, next: nil)
	partition(inspectedNode: root, lastElementBefore: &beforeX, lastElementBehind: &afterX, value: before).next = afterX.next
	return LinkedList(root: beforeX.next)
}

func partition(inspectedNode: Node, lastElementBefore: inout Node, lastElementBehind: inout Node, value: Int) -> Node{
	
	guard let next = inspectedNode.next else{
		if inspectedNode.value < value {
			lastElementBefore.next = inspectedNode
			return inspectedNode
		}else{
			lastElementBehind.next = inspectedNode
			return lastElementBefore
		}
	}

	var nextBefore = lastElementBefore
	var nextBehind = lastElementBehind
	if inspectedNode.value < value {
		lastElementBefore.next = inspectedNode
		nextBefore = inspectedNode
	}else{
		lastElementBehind.next = inspectedNode
		nextBehind = inspectedNode
	}

	return partition(inspectedNode: next, lastElementBefore: &nextBefore, lastElementBehind: &nextBehind, value: value)
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

var testList = LinkedList(root: Node(value: 12, next: Node(value: -2, next: Node(value: 143, next: Node(value: 4, next: Node(value: -10, next: Node(value: 11, next: Node(value: 1, next: nil))))))))
var partitionedListWith0 = LinkedList(root: Node(value: -2, next: Node(value: -10, next: Node(value: 12, next: Node(value: 143, next: Node(value: 4, next: Node(value: 11, next: Node(value: 1, next: nil))))))))

var result = partition(list: testList, before: 0)
assert(compare(this:result, withThis: partitionedListWith0), "List was not correctly partitioned with 0: \(result)")