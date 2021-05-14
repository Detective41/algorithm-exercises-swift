public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

//Solution 1
var res:[Int] = []
func preorder(_ root: Node?) -> [Int] {
    if root == nil {
        return []
    }

    res.append(root!.val)
    for i in 0..<root!.children.count {
        preorder(root!.children[i])
    }
    return res
}

//Solution 2
var res:[Int] = []
var stack:[Node] = []
func preorder(_ root: Node?) -> [Int] {
    if root == nil {
        return []
    }

    stack.append(root!)
    while !stack.isEmpty {
        let popNode = stack.popLast()
        res.append(popNode!.val)
        for i in (0..<popNode!.children.count).reversed() {
            stack.append(popNode!.children[i])
        }
    }
    return res
}