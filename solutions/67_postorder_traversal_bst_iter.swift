//Traverse a binary tree postorder
import Swift 
class Node: CustomStringConvertible{
	var value : Int
	var leftChild : Node?
	var rightChild : Node?
	private let MAX_HEIGHT_DIFF : Int = 1 

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

	

	public func insert(value: Int) -> Node{

		//Finding insert point
		if self.value > value{
			if leftChild == nil{
				leftChild = Node(value: value)
			}else{
				leftChild = leftChild!.insert(value:value)	
			}
		}else if self.value < value{
			if rightChild == nil{
				rightChild = Node(value: value)
			}else{
				rightChild = rightChild!.insert(value:value)
			}
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

			return rightSide
		}else if heightDifference > MAX_HEIGHT_DIFF{
			guard let leftSide = leftChild else{
				return self
			}
			leftChild = leftSide.rightChild
			leftSide.rightChild = self
			
			return leftSide
		}else{
			return self
		}
	}

	public func traversePostorder() -> [Int]{

		var resultArr: [Int] = Array()
		if leftChild != nil{
			resultArr.append(contentsOf: leftChild!.traversePostorder())
		}

		if rightChild != nil{
			resultArr.append(contentsOf: rightChild!.traversePostorder())
		}

		resultArr.append(value) 


		return resultArr
	}
	
}

class BinarySearchTree: CustomStringConvertible{
	var root : Node?

	public var description: String{
		guard root != nil else{
			return "(Empty binary search tree)"
		}

		return "(Binary tree: \(root!)"
	}
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

	

	public func traversePostorder() -> [Int]{
		guard root != nil else{
			return []
		}
		return root!.traversePostorder()

	}
}


//TEST
var node = Node(value: 4)
var leftNode = Node(value: 3)
var rightNode = Node(value: 6)
node.leftChild = leftNode
node.rightChild = rightNode

var testTree = BinarySearchTree(root: node)
var result = testTree.traversePostorder()
var shouldBe = [3,6,4]
assert(result == shouldBe, "Incorrect traversing order \(result), should be \(shouldBe)")

testTree.insert(value: 2)
testTree.insert(value: 1)
testTree.insert(value: 100)
result = testTree.traversePostorder()
shouldBe = [1,3,2,100,6,4]
assert(result == shouldBe, "Incorrect traversing order \(result), should be \(shouldBe)")