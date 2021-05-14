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
 func postorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    
    var res:[Int] = []
   postorderRecu(root!, &res)
   return res
}

func postorderRecu(_ treeNode: TreeNode?, _ res: inout [Int]) {
    if treeNode == nil {
        return
    }
    
    postorderRecu(treeNode!.left, &res)
    postorderRecu(treeNode!.right, &res)
    res.append(treeNode!.val)
}

//Solution 2
func postorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    
    var res:[Int] = []
    var stack:[TreeNode] = []
    var node = root
    while node != nil || !stack.isEmpty {
        while node != nil {
            stack.append(node!)
            res.append(node!.val)
            node = node!.right
        }
        let popNode = stack.popLast()
        node = popNode!.left
    }
    return res.reversed()
}