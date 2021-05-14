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

func minDepth(_ root: TreeNode?) -> Int {
    //如果当前节点为空
    if root == nil {
        return 0
    }
    //如果当前节点的左节点和右节点都为空
    if root!.left == nil && root!.right == nil {
        return 1
    }
    //如果当前节点的左节点和右节点至少有一个不为空
    if root!.left == nil || root!.right == nil {
        return root!.left == nil ? minDepth(root!.right) + 1 : minDepth(root!.left) + 1
    }
    //如果当前节点的左节点和右节点都不为空
    return min(minDepth(root!.left), minDepth(root!.right)) + 1
}
