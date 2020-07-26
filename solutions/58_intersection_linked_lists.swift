//Find the intersection of two linked lists
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

func findIntersection(between: LinkedList, and: LinkedList) -> Node?{
	
	guard let thisRoot = between.root else{
		return nil
	}

	guard let otherRoot = and.root else{
		return nil
	}

	let (_, foundNode) = findIntersection(between: thisRoot, 0 , and: otherRoot, 0)
	return foundNode
}

func findIntersection(between: Node, _ betweenCount: Int, and: Node, _ andCount: Int) -> (Int, Node?){
	

	guard between.next != nil || and.next != nil else{
		print("\(between.value) / \(and.value) \(and === between)")
		let diff = betweenCount - andCount
		if and === between {
			return (diff, and)
		}else{
			return (diff, nil)
		}
	}
	print("\(between.value) / \(and.value)")
		print("Hallo")

	var nextBetween = between
	var betweenChange = 0
	if between.next != nil{
		nextBetween = between.next!
		betweenChange += 1
	}
	print("Hallo")

	var nextAnd = and
	var andChange = 0
	if and.next != nil{
		nextAnd = and.next!
		andChange += 1
	}

	
	let (lengthDifference, foundNode) = findIntersection(between: nextBetween, betweenCount + betweenChange, and: nextAnd, andCount + andChange)
	print("\(between.value) / \(and.value) \(and === between)")
	if and === between {
		return (lengthDifference, and)
	}else if foundNode != nil{
		return (lengthDifference, foundNode)
	}else{
		return (lengthDifference, nil)
	}
}


//Creating intersection
var oneElementIntersection = Node(value: 102, next: nil)
var threeElementIntersection = Node(value: 102, next: Node(value: 103, next: Node( value: 104, next: nil)))

//Creating test data
var onlyIntersection = LinkedList(root: oneElementIntersection)
var nodeBeforeIntersection = LinkedList(root: Node(value: 1, next: oneElementIntersection))
var anotherNodeBeforeIntersection = LinkedList(root: Node(value: 2, next: oneElementIntersection))
var threeNodesBeforeIntersection = LinkedList(root: Node(value: 1, next: oneElementIntersection))
var emptyList = LinkedList(root: nil)
var oneElement = LinkedList(root: Node(value: 1, next: nil))
var manyElements = LinkedList(root: Node(value: 2, next: Node(value: 3, next: Node( value: 4, next: nil))))


//Test with one Element in intersection
var result = findIntersection(between: onlyIntersection, and: nodeBeforeIntersection)
assert(result === oneElementIntersection, "Did find incorrect intersection between onlyIntersection and nodeBeforeIntersection: \(result as Optional)")

result = findIntersection(between: onlyIntersection, and: threeNodesBeforeIntersection)
assert(result === oneElementIntersection, "Did find incorrect intersection between onlyIntersection and threeNodesBeforeIntersection: \(result as Optional)")

result = findIntersection(between: nodeBeforeIntersection, and: threeNodesBeforeIntersection)
assert(result === oneElementIntersection, "Did find incorrect intersection between nodeBeforeIntersection and threeNodesBeforeIntersection: \(result as Optional)")

result = findIntersection(between: threeNodesBeforeIntersection, and: nodeBeforeIntersection)
assert(result === oneElementIntersection, "Did find incorrect intersection between nodeBeforeIntersection and threeNodesBeforeIntersection: \(result as Optional)")

result = findIntersection(between: anotherNodeBeforeIntersection, and: nodeBeforeIntersection)
assert(result === oneElementIntersection, "Did find incorrect intersection between anotherNodeBeforeIntersection and nodeBeforeIntersection: \(result as Optional)")


//Test with three Elements
onlyIntersection = LinkedList(root: threeElementIntersection)
nodeBeforeIntersection = LinkedList(root: Node(value: 1, next: threeElementIntersection))
threeNodesBeforeIntersection = LinkedList(root: Node(value: 1, next: threeElementIntersection))

result = findIntersection(between: onlyIntersection, and: nodeBeforeIntersection)
assert(result === threeElementIntersection, "Did find incorrect intersection between onlyIntersection and nodeBeforeIntersection: \(result as Optional)")

result = findIntersection(between: onlyIntersection, and: threeNodesBeforeIntersection)
assert(result === threeElementIntersection, "Did find incorrect intersection between onlyIntersection and threeNodesBeforeIntersection: \(result as Optional)")

result = findIntersection(between: nodeBeforeIntersection, and: threeNodesBeforeIntersection)
assert(result === threeElementIntersection, "Did find incorrect intersection between nodeBeforeIntersection and threeNodesBeforeIntersection: \(result as Optional)")



//Test cases, where no intersection exists
result = findIntersection(between: emptyList, and: onlyIntersection)
assert(result == nil, "Did find an intersection between emptyList and onlyIntersection: \(result as Optional)")

result = findIntersection(between: emptyList, and: nodeBeforeIntersection)
assert(result == nil, "Did find an intersection between emptyList and onlyIntersection: \(result as Optional)")

result = findIntersection(between: emptyList, and: threeNodesBeforeIntersection)
assert(result == nil, "Did find an intersection between emptyList and onlyIntersection: \(result as Optional)")

result = findIntersection(between: oneElement, and: manyElements)
assert(result == nil, "Did find an intersection between emptyList and onlyIntersection: \(result as Optional)")