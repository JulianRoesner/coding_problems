//Find the length of a single linked list
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

func length(of: LinkedList) -> Int{
	guard let root = of.root else{
		return 0
	}

	return length(of: root)
}

func length(of: Node) -> Int{
	guard let next = of.next else{
		return 1
	}

	return length(of: next) + 1
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
var testList = LinkedList(root: Node(value: 17, next: Node(value: 2, next: Node(value: 17, next: Node(value: 4, next: Node(value: 6, next: Node(value: 6, next: nil)))))))
var testList2 = LinkedList(root: Node(value: 17, next: Node(value: 2, next: Node(value: 4, next: Node(value: 6, next: nil)))))

var result = length(of: testList)
assert(result == 6, "Incorrect length of empty list \(result) instead of 6")

result = length(of: testList2)
assert(result == 4, "Incorrect length of empty list \(result) instead of 4")

testList = LinkedList(root: nil)
result = length(of: testList)
assert(result == 0, "Incorrect length of empty list \(result) instead of 0")