//Merge two sorted linked lists
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

func mergeList(this: LinkedList, withThis: LinkedList) -> LinkedList{
	guard let thisRoot = this.root else {
		return withThis
	}

	guard let withThisRoot = withThis.root else{
		return this
	}
	
	return  LinkedList(root: merge(this: thisRoot, withThis: withThisRoot))
	
	
}

func merge(this: Node?, withThis: Node?) -> Node?{

	guard let thisNode = this else{
		return withThis
	}

	guard let withThisNode = withThis else{
		return this
	}

	if (thisNode.value < withThisNode.value){
		return  Node(value: thisNode.value, next: merge(this: thisNode.next, withThis: withThisNode))
	}else{
		return Node(value: withThisNode.value, next: merge(this: thisNode, withThis: withThisNode.next))
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

var firstList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: nil)))))
var secondList = LinkedList(root: Node(value: 2, next: Node(value: 7, next: Node(value: 8, next: nil))))
var mergedList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: Node(value: 7, next: Node(value: 8, next: nil))))))))

var result = mergeList(this: firstList, withThis: secondList )
assert(compare(this:result, withThis: mergedList), " Not correctly merged \(result)")


//Test consecutive lists merging
firstList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: nil)))))
secondList = LinkedList(root: Node(value: 5, next: Node(value: 7, next: Node(value: 8, next: nil))))
mergedList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: Node(value: 5, next: Node(value: 7, next: Node(value: 8, next: nil))))))))

result = mergeList(this: firstList, withThis: secondList)
assert(compare(this:result, withThis: mergedList), " Not correctly merged \(result)")

//Test first list bigger then second
firstList = LinkedList(root: Node(value: 5, next: Node(value: 7, next: Node(value: 8, next: nil))))
secondList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: nil)))))
mergedList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: Node(value: 5, next: Node(value: 7, next: Node(value: 8, next: nil))))))))

result = mergeList(this: firstList, withThis: secondList)
assert(compare(this:result, withThis: mergedList), " Not correctly merged \(result)")