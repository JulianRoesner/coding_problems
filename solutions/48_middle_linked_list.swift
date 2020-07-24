//Find the middle in a linked list
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

func findMiddle(inList: inout LinkedList) -> Node?{
	guard let root = inList.root else{
		return nil;
	}

	var middle = root;
	var endPointer = root;
	var counter = 0;
	while let next = endPointer.next{
		endPointer = next;
		counter += 1;
		if counter >= 2{
			counter = 0;
			if middle.next != nil{
				middle = middle.next!;
			} 
		}
	}

	return middle
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

var oddMiddle = Node(value: 4, next: Node(value: 5, next: Node(value: 6, next: Node(value: 7, next: nil))))
var oddList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: oddMiddle))))
var evenMiddle = Node(value: 3, next: Node(value: 4, next: Node(value: 5, next: Node(value: 6, next: nil))))
var evenList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: evenMiddle)))

var result = findMiddle(inList: &oddList)
assert(result === oddMiddle, "Found incorrect middle in oddList \(result as Optional)")

result = findMiddle(inList: &evenList)
assert(result === evenMiddle, "Found incorrect middle in evenList \(result as Optional)")