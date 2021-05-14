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
func postorder(_ root: Node?) -> [Int] {
    if root == nil {
        return []
    }

    for i in 0..<root!.children.count {
       let node = root!.children[i]
       postorder(node)
    }
    res.append(root!.val)
    return res
}

//Solution 2
var res:[Int] = []
var stack:[Node] = []
func postorder(_ root: Node?) -> [Int] {
    if root == nil {
        return []
    }
    
    stack.append(root!)
    while !stack.isEmpty {
        let node = stack.popLast()
        res.append(node!.val)
        for i in 0..<node!.children.count {
            stack.append(node!.children[i])
        }
    }
    return res.reversed()
}