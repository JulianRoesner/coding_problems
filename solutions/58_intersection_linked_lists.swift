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

	let lengthDiff = findLengthDifference(between: thisRoot, 0 , and: otherRoot, 0)
	
	return	findIntersection(between: thisRoot, and: otherRoot, lengthDiff: lengthDiff)
}

func findLengthDifference(between: Node, _ betweenCount: Int, and: Node, _ andCount: Int) -> Int{

	guard !(between.next == nil && and.next == nil) else{
		return betweenCount - andCount
	} 

	var betweenOffset = 0
	var nextBetween = between
	if between.next != nil{
		nextBetween = between.next!
		betweenOffset += 1
	}

	var andOffset = 0
	var nextAnd = and
	if and.next != nil{
		nextAnd = and.next!
		andOffset += 1
	}

	return findLengthDifference(between: nextBetween, betweenCount + betweenOffset, and: nextAnd, andCount + andOffset)
}

func findIntersection(between: Node, and: Node, lengthDiff: Int ) -> Node?{
	guard !(between.next == nil && and.next == nil) else{
		if (lengthDiff == 0 && between === and){
			return and
		}else{
			return nil
		}
	}
	if(lengthDiff > 0){
		if let nextBetween = between.next{
			return findIntersection(between: nextBetween, and: and, lengthDiff: lengthDiff - 1)	
		}else{
			return findIntersection(between: between, and: and, lengthDiff: lengthDiff - 1)	
		}
	}else if(lengthDiff < 0){
		if let nextAnd = and.next{
			return findIntersection(between: between, and: nextAnd, lengthDiff: lengthDiff + 1)	
		}else{
			return findIntersection(between: between, and: and, lengthDiff: lengthDiff + 1)
		}
	}else{
		if areSame(this: between, andThat: and){
			return between
		}else{
			if between.next != nil && and.next != nil{
				return findIntersection(between: between.next!, and: and.next!, lengthDiff: lengthDiff )	
			}else{				
				return nil
			}			
		}
	}
}

func areSame(this: Node, andThat: Node) -> Bool{
	guard !(this.next == nil && andThat.next == nil) else{
		return this === andThat
	}
	var nextThis = this
	var nextThat = andThat

	if this.next != nil{
		nextThis = this.next!
	}

	if andThat.next != nil{
		nextThat = andThat.next!
	}

	return this === andThat && areSame(this: nextThis, andThat: nextThat)
}

//Creating intersection
var oneElementIntersection = Node(value: 102, next: nil)
var threeElementIntersection = Node(value: 102, next: Node(value: 103, next: Node( value: 104, next: nil)))

//Creating test data
var onlyIntersection = LinkedList(root: oneElementIntersection)
var nodeBeforeIntersection = LinkedList(root: Node(value: 1, next: oneElementIntersection))
var anotherNodeBeforeIntersection = LinkedList(root: Node(value: 2, next: oneElementIntersection))
var threeNodesBeforeIntersection = LinkedList(root: Node(value: 1, next: Node(value: 17, next: Node(value: 12, next: oneElementIntersection))))
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
assert(result === threeElementIntersection, "For longer intersection. Did find incorrect intersection between onlyIntersection and nodeBeforeIntersection: \(result as Optional)")

result = findIntersection(between: onlyIntersection, and: threeNodesBeforeIntersection)
assert(result === threeElementIntersection, "For longer intersection. Did find incorrect intersection between onlyIntersection and threeNodesBeforeIntersection: \(result as Optional)")

result = findIntersection(between: nodeBeforeIntersection, and: threeNodesBeforeIntersection)
assert(result === threeElementIntersection, "For longer intersection. Did find incorrect intersection between nodeBeforeIntersection and threeNodesBeforeIntersection: \(result as Optional)")



//Test cases, where no intersection exists
result = findIntersection(between: emptyList, and: onlyIntersection)
assert(result == nil, "Did find an intersection between emptyList and onlyIntersection: \(result as Optional)")

result = findIntersection(between: emptyList, and: nodeBeforeIntersection)
assert(result == nil, "Did find an intersection between emptyList and onlyIntersection: \(result as Optional)")

result = findIntersection(between: emptyList, and: threeNodesBeforeIntersection)
assert(result == nil, "Did find an intersection between emptyList and onlyIntersection: \(result as Optional)")

result = findIntersection(between: oneElement, and: manyElements)
assert(result == nil, "Did find an intersection between emptyList and onlyIntersection: \(result as Optional)")