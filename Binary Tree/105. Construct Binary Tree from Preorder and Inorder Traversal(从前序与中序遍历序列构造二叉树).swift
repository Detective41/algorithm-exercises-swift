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

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.count == 0 || inorder.count == 0 {
        return nil
    }
    
    var dic: [Int:Int] = [:]//[元素值:元素索引]
    for i in 0..<inorder.count {
        dic[inorder[i]] = i
    }
    return buildTreeProcess(dic, preorder, inorder, 0, preorder.count-1, 0, inorder.count-1)
}

func buildTreeProcess(_ map: [Int:Int], _ preorder: [Int], _ inorder: [Int], _ preLeft: Int, _ preRight: Int, _ inLeft: Int, _ inRight: Int) -> TreeNode? {
    if preLeft > preRight || inLeft > inRight {
        return nil
    }
    
    let root = TreeNode(preorder[preLeft])
    let rootIdx = map[root.val]
    root.left = buildTreeProcess(map, preorder, inorder, preLeft+1, rootIdx!-inLeft+preLeft, inLeft, rootIdx!-1)
    root.right = buildTreeProcess(map, preorder, inorder, rootIdx!-inLeft+preLeft+1, preRight, rootIdx!+1, inRight)
    return root
}