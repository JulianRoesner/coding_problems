//Find the sum of two single linked list using a stack
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

func sum(of: LinkedList, and: LinkedList) -> Int{
	
	var stack : [Int] = Array()

	fill(stack: &stack, with: of.root, and: and.root)

	var sum = 0
	while let next = stack.popLast(){
		sum += next
	}

	return sum
}

func fill(stack: inout [Int], with: Node?, and: Node?){
	guard with != nil || and != nil else{
		return
	} 
	var node = with
	var otherNode = and
	
	if with != nil{
		stack.append(with!.value)
		node = with!.next
	}

	if and != nil{
		stack.append(and!.value)
		otherNode = and!.next
	}

	fill(stack: &stack, with: node, and: otherNode)


//Tests
var list1 = LinkedList(root: Node(value: 17, next: Node(value: 2, next: Node(value: 1, next: Node(value: 4, next: Node(value: 6, next: Node(value: 6, next: nil)))))))
var list2 = LinkedList(root: Node(value: 10, next: Node(value: 2, next: Node(value: 3, next: Node(value: 6, next: nil)))))
var list3 = LinkedList(root: Node(value: -10, next: Node(value: 2, next: Node(value: 3, next: Node(value: 6, next: nil)))))

var result = sum(of: list1, and: list2)
assert(result == 57, "Sum was incorrect \(result), should have been 57")

result = sum(of: list1, and: list3)
assert(result == 37, "Sum with negative values was incorrect \(result), should have been 37")

list1 = LinkedList(root: nil)
result = sum(of: list1, and: list2)
assert(result == 21, "Sum with empty list was incorrect \(result), should have been 21")


list2 = LinkedList(root: nil)
result = sum(of: list1, and: list2)
assert(result == 0, "Sum with two empty lists was incorrect \(result), should have been 0")