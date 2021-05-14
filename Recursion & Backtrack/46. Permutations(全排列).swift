func permute(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    var stack: [Int] = []
    var visited: [Int] = Array(repeating: 0, count: nums.count)
    permuteHelper(nums, &visited, &stack, &res)
    return res
}

func permuteHelper(_ nums: [Int], _ visited: inout [Int], _ stack: inout [Int], _ res: inout [[Int]]) {
    if stack.count == nums.count {
        res.append(stack)
        return
    }
    //关键是理解循环里面递归的流程
    for i in 0..<nums.count {
        if visited[i] == 1 {
            continue
        }
        visited[i] = 1
        stack.append(nums[i])
        permuteHelper(nums, &visited, &stack, &res)
        visited[i] = 0
        stack.popLast()
    }
}