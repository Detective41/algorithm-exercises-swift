func climbStairs(_ n: Int) -> Int {
    guard n > 2 else {
        return n
    }
    
    var a = 1, b = 2, res = a + b
    for _ in 3..<n {
        a = b
        b = res
        res = a + b
    }
    return res
}