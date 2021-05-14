func combine(_ n: Int, _ k: Int) -> [[Int]] {
    if k > n {
        return []
    }
    
    var res: [[Int]] = []
    var stack: [Int] = []
    combineHelper(1, n, k, &stack, &res)
    return res
}

func combineHelper(_ start: Int, _ n: Int, _ k: Int, _ stack: inout [Int], _ res: inout [[Int]])  {
    if stack.count == k {
        res.append(stack)
        return
    }
    //重点是取start的最大值，最大值与还需要读多少个数有关
    for i in start...(n-(k-stack.count)+1) {
        stack.append(i)
        combineHelper(i+1, n, k, &stack, &res)
        stack.popLast()
    }
}