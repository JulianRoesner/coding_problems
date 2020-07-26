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

func partition(list: inout LinkedList, before: Int){
	guard let root = list.root else{
		return 
	}
	var startBefore : Node? = nil
	var startBehind : Node? = nil
	let (endOfBeforeX, beforeX, afterX) = partition(inspectedNode: root, lastElementBefore: &startBefore, lastElementBehind: &startBehind, value: before) 
	if beforeX != nil {
		endOfBeforeX!.next = afterX
		list.root = beforeX
	}else{
		list.root = afterX
	}
	
}

func partition(inspectedNode: Node, lastElementBefore: inout Node?, lastElementBehind: inout Node?, value: Int) -> (Node?,Node?,Node?){
	
	guard let next = inspectedNode.next else{
		if inspectedNode.value < value {
			if lastElementBefore == nil {
				lastElementBefore = inspectedNode
			}else{
				lastElementBefore!.next = inspectedNode	
			}	
			return (inspectedNode, nil, nil)
		}else{
			if lastElementBehind == nil{
				lastElementBehind = inspectedNode
			}else{
				lastElementBehind!.next = inspectedNode
			}			
			return (lastElementBefore, nil, nil)
		}
	}

	var nextBefore = lastElementBefore
	var nextBehind = lastElementBehind
	var beforePointer : Node? = nil
	var afterPointer : Node? = nil
	if inspectedNode.value < value {
		if lastElementBefore == nil {
			lastElementBefore = inspectedNode
			beforePointer =  lastElementBefore
		}else{
			lastElementBefore!.next = inspectedNode	
		}
		nextBefore = inspectedNode
	}else{
		if lastElementBehind == nil{
			lastElementBehind = inspectedNode
			afterPointer = lastElementBehind
		}else{
			lastElementBehind!.next = inspectedNode
		}	
		nextBehind = inspectedNode
	}

	let (endOfBeforeX, foundBeforePointer, foundAfterPointer) = partition(inspectedNode: next, lastElementBefore: &nextBefore, lastElementBehind: &nextBehind, value: value)

	if (beforePointer == nil){
		beforePointer = foundBeforePointer
	}
	
	if (afterPointer == nil){
		afterPointer = foundAfterPointer
	} 

	return (endOfBeforeX, beforePointer, afterPointer)

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

partition(list: &testList, before: 0)
assert(compare(this:testList, withThis: partitionedListWith0), "List was not correctly partitioned with 0: \(testList)")