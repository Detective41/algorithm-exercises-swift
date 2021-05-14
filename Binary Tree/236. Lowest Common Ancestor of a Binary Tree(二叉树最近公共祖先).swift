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

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil || root === p || root === q {
        return root
    }
    let left = lowestCommonAncestor(root!.left, p, q)
    let right = lowestCommonAncestor(root!.right, p, q)
    if left != nil && right != nil {//如果p，q节点分别在root的左右子树
        return root
    } else if left != nil {//如果p，q节点都在左子树
        return left
    } else if right != nil {//如果p，q节点都在右子树
        return right
    } else {//如果p，q节点都不存在
        return nil
    }
}