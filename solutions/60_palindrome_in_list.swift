//Check for palindrome in a linked list
import Swift 
class Node: CustomStringConvertible{
	var value : Character
	var next : Node? = nil

	init(value : Character, next: Node?){
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

func isPalindrome(this: LinkedList)->Bool{
	guard let root = this.root else{
		return true
	}

	let (result, _) = isPalindrome(this: root, compare: root)
	return result
}

func isPalindrome(this: Node, compare: Node) -> (Bool, Node){
	guard let next = this.next else{
		return (this.value == compare.value, compare)
	}

	let (result, compareForThisNode) = isPalindrome(this: next, compare: compare)
	guard let actualCompare = compareForThisNode.next else{
		return (false, compareForThisNode)
	}

	return (result && actualCompare.value == this.value, actualCompare)
}

//TESTS
var palindrome = LinkedList(root: Node(value: "h", next: Node(value: "a", next: Node(value: "n", next: Node(value: "n", next: Node(value: "a", next: Node(value: "h", next: nil)))))))
var palindrome1 =  LinkedList(root: Node(value: "h", next: Node(value: "a", next: Node(value: "n", next: Node(value: "x", next: Node(value: "n", next: Node(value: "a", next: Node(value: "h", next: nil))))))))
var noPalindrome1 = LinkedList(root: Node(value: "h", next: Node(value: "a", next: Node(value: "n", next: Node(value: "n", next: Node(value: "x", next: Node(value: "h", next: nil)))))))
var noPalindrome2 = LinkedList(root: Node(value: "a", next: Node(value: "a", next: Node(value: "n", next: Node(value: "n", next: Node(value: "x", next: Node(value: "h", next: nil)))))))
var noPalindrome3 = LinkedList(root: Node(value: "h", next: Node(value: "a", next: Node(value: "n", next: Node(value: "n", next: Node(value: "a", next: Node(value: "H", next: nil)))))))
var emptyList = LinkedList(root: nil)

assert(isPalindrome(this:palindrome), "\(palindrome) incorrectly found no palindrome")
assert(isPalindrome(this:palindrome1), "\(palindrome1) incorrectly found no palindrome")
assert(isPalindrome(this:emptyList), "In empty list incorrectly found no palindrome")
assert(isPalindrome(this:noPalindrome1) != true, "\(noPalindrome1) incorrectly found a palindrome")
assert(isPalindrome(this:noPalindrome2) != true, "\(noPalindrome2) incorrectly found a palindrome")
assert(isPalindrome(this:noPalindrome3) != true, "\(noPalindrome3) incorrectly found a palindrome")