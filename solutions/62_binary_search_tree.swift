//Implement a binary search tree
import Swift 
class Node: CustomStringConvertible{
	var value : Int
	var leftChild : Node?
	var rightChild : Node?
	private let MAX_HEIGHT_DIFF : Int = 1 

	init(value: Int, leftChild: Node, rightChild: Node){
		self.value = value
		self.leftChild = leftChild
		self.rightChild = rightChild
	}

	init(value: Int, leftChild: Node){
		self.value = value
		self.leftChild = leftChild
		self.rightChild = nil
	}

	init(value: Int, rightChild: Node){
		self.value = value
		self.leftChild = nil
		self.rightChild = rightChild
	}

	init(value: Int){
		self.value = value
		self.leftChild = nil
		self.rightChild = nil
	}

	public var description: String{
		return "(Node: \(value)"
	}
	private var leftHeight: Int{
		guard let leftSide = leftChild else{
			return 0
		}

		return leftSide.height 
	} 

	private var rightHeight: Int{
		guard let rightSide = rightChild else{
			return 0
		}

		return rightSide.height 
	} 

	public var height: Int{
		if leftHeight > rightHeight{
			return leftHeight + 1
		}else{
			return rightHeight + 1
		}
	}

	private var heightDifference : Int{
		return leftHeight - rightHeight
	}

	public func insert(value: Int) -> Node{

		//Finding insert point
		if self.value > value{
			if leftChild == nil{
				leftChild = Node(value: value)
			} 

			leftChild = leftChild!.insert(value:value)
		}else if self.value < value{
			if rightChild == nil{
				rightChild = Node(value: value)
			}
			rightChild = rightChild!.insert(value:value)
		}else{
			//Already in the search tree
			return self
		}

		//Balance tree with height criterium
		if heightDifference < -MAX_HEIGHT_DIFF{
			guard let rightSide = rightChild else{
				return self
			}
			rightChild = rightSide.leftChild
			rightSide.leftChild = self

			return rightChild!
		}else if heightDifference > MAX_HEIGHT_DIFF{
			guard let leftSide = leftChild else{
				return self
			}
			leftChild = leftSide.leftChild
			leftSide.leftChild = self
			
			return leftChild!
		}else{
			return self
		}
	}

	
}

class BinarySearchTree: CustomStringConvertible{
	var root : Node?

	init(root: Node){
		self.root = root
	}

	init(){
		self.root = nil
	}

	public func insert(value: Int){
		if root == nil{
			root = Node(value: value)
		}else{
			root = root!.insert(value: value)
		}
	}

	public var description: String{
		guard root != nil else{
			return "(Empty binary search tree)"
		}

		return "(Binary tree: \(root!)"
	}
}


//Creating a BST for a test
var node = Node(value: 7)
var leftNode = Node(value: 4)
var rightNode = Node(value: 6)
node.leftChild = leftNode
node.rightChild = rightNode
var tree = BinarySearchTree(root: node)