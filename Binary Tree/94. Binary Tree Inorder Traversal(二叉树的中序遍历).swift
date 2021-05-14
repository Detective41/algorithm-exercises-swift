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
 func inorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    
    var res:[Int] = []
    inorderRecur(root!, &res)
    return res
 }

 func inorderRecur(_ treeNode: TreeNode?, _ arr: inout [Int]) {
    if treeNode == nil {
        return
    }
    
    inorderRecur(treeNode!.left, &arr)
    arr.append(treeNode!.val)
    inorderRecur(treeNode!.right, &arr)
}

//Solution 2
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    
    var res:[Int] = []
    var stack:[TreeNode] = []
    var node = root
    while node != nil || !stack.isEmpty {
        while node != nil {
            stack.append(node!)
            node = node!.left
        }
        let popNode = stack.popLast()
        res.append(popNode!.val)
        node = popNode!.right
    }
    return res
}