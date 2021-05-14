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

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var str = ""
        recursion(root, &str)
        str.removeLast()
        return str
    }
    
    func recursion(_ node: TreeNode?, _ str: inout String) {
        if node == nil {
            str = str + "null,"
            return
        }
        str = str + "\(node!.val),"
        recursion(node!.left, &str)
        recursion(node!.right, &str)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        if data.count == 0 {
            return nil
        }
        
        var arr = data.split(separator: ",")
        return buildBinaryTree(&arr)
    }
    
    func buildBinaryTree(_ arr: inout [Substring]) -> TreeNode? {
        let firstValue = arr.removeFirst()
        if firstValue == "null" {
            return nil
        }
        
        let root = TreeNode(Int(firstValue)!)
        root.left = buildBinaryTree(&arr)
        root.right = buildBinaryTree(&arr)
        return root
    }
}