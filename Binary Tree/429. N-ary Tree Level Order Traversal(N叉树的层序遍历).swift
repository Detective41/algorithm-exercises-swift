public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

func levelOrder(_ root: Node?) -> [[Int]] {
    if root == nil {
        return []
    }
    
    var res:[[Int]] = []
    calEachLevel(root!, 0, &res)
    return res
}

func calEachLevel(_ node: Node, _ level: Int, _ res: inout [[Int]]) {
    if level >= res.count {
        var temp:[Int] = []
        temp.append(node.val)
        res.append(temp)
    } else {
        var temp = res[level]
        temp.append(node.val)
        res[level] = temp
    }
    for i in 0..<node.children.count {
        calEachLevel(node.children[i], level+1, &res)
    }
}