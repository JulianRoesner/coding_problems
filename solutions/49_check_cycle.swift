//Check for a cycle in linked list and find beginning of circle
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

func findCycle(inList: inout LinkedList) -> (Bool, Node?){
	guard var current = inList.root else{
		return (false, nil)	
	}
	var seenNodes : [Node] = []
	while let next = current.next{
		if seenNodes.contains(where: {$0 === next}){
			return (true, next)
		}else{
			seenNodes.append(current)
			current = next
		}
	}
	return (false, nil)
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

//Creating a cycle
var endOfCycle = Node(value: 102, next: nil)
var beginningOfCylce = Node(value: 100, next: Node(value: 101, next: endOfCycle))
endOfCycle.next = beginningOfCylce	//Connect cycle

//Creating test data
var onlyCycle = LinkedList(root: beginningOfCylce)
var nodesBeforeCycle = LinkedList(root: Node(value: 1, next: beginningOfCylce))
var emptyList = LinkedList(root: nil)
var oneElement = LinkedList(root: Node(value: 1, next: nil))
var noCycle = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: nil)))))

var (isCycle, beginning) = findCycle(inList: &onlyCycle)
assert(isCycle, "Did not find a cycle in onlyCycle")
assert(beginning === beginningOfCylce, "Did find incorrect beginning of cycle in onlyCycle \(beginning as Optional)")

(isCycle, beginning) = findCycle(inList: &nodesBeforeCycle)
assert(isCycle, "Did not find a cycle in nodesBeforeCycle")
assert(beginning === beginningOfCylce, "Did find incorrect beginning of cycle in nodesBeforeCycle \(beginning as Optional)")

(isCycle, beginning) = findCycle(inList: &emptyList)
assert(!isCycle, "Did find a cycle in emptyList")
assert(beginning == nil, "Did find a beginning of cycle in emptyList \(beginning as Optional)")

(isCycle, beginning) = findCycle(inList: &oneElement)
assert(!isCycle, "Did find a cycle in oneElement")
assert(beginning == nil, "Did find a beginning of cycle in oneElement \(beginning as Optional)")

(isCycle, beginning) = findCycle(inList: &noCycle)
assert(!isCycle, "Did find a cycle in noCycle")
assert(beginning == nil, "Did find a beginning of cycle in noCycle \(beginning as Optional)")