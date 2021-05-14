public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
             self.val = val
             self.left = left
             self.right = right
    }
}

 //Solution 1
func isValidBST(_ root: TreeNode?) -> Bool {
    return recursion(root, Int.min, Int.max)
}

func recursion(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
    if node == nil {
        return true
    }
    if node!.val <= min || node!.val >= max {
        return false
    }
    return recursion(node!.left, min, node!.val) && recursion(node!.right, node!.val, max)
}

//Solution 2
func isValidBST(_ root: TreeNode?) -> Bool {
    return inorderTraversal(root)
}

func inorderTraversal(_ node: TreeNode?) -> Bool {
    if node == nil {
        return true
    }
    
    var node = node
    var stack: [TreeNode] = []
    var preNode: TreeNode?
    while node != nil || !stack.isEmpty {
        while node != nil {
            stack.append(node!)
            node = node!.left
        }
        let popNode = stack.popLast()
        if preNode != nil {
            if preNode!.val >= popNode!.val {
                return false
            }
        }
        preNode = popNode
        node = popNode!.right
    }
    return true
}