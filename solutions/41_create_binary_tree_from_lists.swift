//Create a binary tree from a sorted list
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

class TreeNode: CustomStringConvertible{
	var value : Int
	var leftChild : TreeNode? = nil
	var rightChild : TreeNode? = nil

	init(value: Int, leftChild: TreeNode?, rightChild: TreeNode?){
		self.value = value
		self.leftChild = leftChild
		self.rightChild = rightChild
	}

	public var description: String{
		let leftText : String
		if let lefti = leftChild {
		 	leftText = "\(lefti)"
		}  else{
			leftText = "nil"
		}
		let rightText : String
		if let righti = rightChild {
		 	rightText = "\(righti)"
		}  else{
			rightText = "nil"
		}

		return "(Node: \(value) left: \(leftText) right:\(rightText))"
	}

	public var height: Int{
		if(leftChild == nil && rightChild == nil){
			return 0
		}else if(leftChild == nil){
			return rightChild!.height + 1
		}else if(rightChild == nil){
			return leftChild!.height + 1
		}else{
			if(leftChild!.height > rightChild!.height){
				return leftChild!.height + 1
			}else{
				return rightChild!.height + 1
			}
		}
	}

	public func insert(value: Int) -> TreeNode{
		if(self.value > value){
			if let lefti = leftChild{
				leftChild = lefti.insert(value: value)
				if let righti = rightChild{
					if lefti.height > righti.height + 1{
						leftChild = lefti.leftChild
						lefti.rightChild = self
						return lefti
					}else{
						return self
					}
				}else if lefti.height > 1{
					leftChild = lefti.leftChild
					lefti.rightChild = self
					return lefti
				}else{
					return self
				}
			} else{
				leftChild = TreeNode(value: value, leftChild: nil, rightChild: nil)
				return self
			}
		}else{
			if let righti = rightChild{
				rightChild = righti.insert(value: value)
				if let lefti = leftChild{
					if righti.height > lefti.height + 1{
						rightChild = righti.leftChild
						righti.leftChild = self
						return righti
					}else{
						return self
					}
				}else if righti.height > 1{
						rightChild = righti.leftChild
						righti.leftChild = self
						return righti
				}else{
					return self
				}
			}else{
				rightChild = TreeNode(value: value, leftChild: nil, rightChild: nil)
				return self
			}
		}

	}
}

class BinarySearchTree: CustomStringConvertible{
	var root : TreeNode?

	init(root: TreeNode?){
		self.root = root
	}

	public var description: String { 
		return "(LinkedList:  root \(root as TreeNode?)) "		
	}

	public func insert(value: Int){
		guard let start = root else{
			root = TreeNode(value: value, leftChild: nil, rightChild: nil)
			return
		}

		root = start.insert(value: value)
	}
}

func createBinaryTree(from: LinkedList)->BinarySearchTree{
	var tree = BinarySearchTree(root: nil)
	return createBinaryTree(from: from.root, with: &tree)
}

func createBinaryTree(from: Node?, with: inout BinarySearchTree) -> BinarySearchTree{
	guard let node = from else{
		return with
	}

	with.insert(value: node.value)

	return createBinaryTree(from: node.next, with: &with)
}


//TESTS
func compare(thisTree: BinarySearchTree, withThat: BinarySearchTree) -> Bool{
	guard let thisRoot = thisTree.root else{
		return withThat.root == nil
	}

	guard let thatRoot = withThat.root else{
		return false
	}

	return compare(thisNode: thisRoot, withThat: thatRoot)
}

func compare(thisNode: TreeNode?, withThat: TreeNode?) -> Bool{

	guard let thisNodeBind = thisNode else{
		return withThat == nil
	}

	guard let thatNodeBind = withThat else{
		return false
	}
	let valueComparison = thisNodeBind.value == thatNodeBind.value
	let leftComparison = compare(thisNode: thisNodeBind.leftChild, withThat: thatNodeBind.leftChild)
	let rightComparison = compare(thisNode: thisNodeBind.rightChild, withThat: thatNodeBind.rightChild)
	return  valueComparison && leftComparison && rightComparison
}
var testList = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: Node(value: 5, next: Node(value: 7, next: Node(value: 8, next: nil))))))))
var shouldBe = BinarySearchTree(root: TreeNode(value: 3, leftChild: TreeNode(value: 2, leftChild: TreeNode(value: 1, leftChild: nil, rightChild: nil), rightChild: nil), rightChild: TreeNode(value: 5, leftChild: TreeNode(value: 4, leftChild: nil, rightChild: nil), rightChild: TreeNode(value: 7, leftChild: nil, rightChild: TreeNode(value: 8, leftChild: nil, rightChild: nil)))))

//Test Compare
assert(compare(thisTree: shouldBe, withThat: shouldBe), "Comparison not working")

var result = createBinaryTree(from: testList)
assert(compare(thisTree: result, withThat: shouldBe), "Tree was not correctly created \(result)")