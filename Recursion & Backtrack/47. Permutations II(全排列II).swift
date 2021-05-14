func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    var stack: [Int] = []
    var visited: [Int] = Array(repeating: 0, count: nums.count)
    permuteUniqueHelper(nums.sorted(), &visited, &stack, &res)
    return res
}

func permuteUniqueHelper(_ nums: [Int], _ visited: inout [Int], _ stack: inout [Int], _ res: inout [[Int]]) {
    if stack.count == nums.count {
        res.append(stack)
        return
    }
    
    //关键是理解循环里面递归的流程和剪枝的条件
    for i in 0..<nums.count {
        if visited[i] == 1 {
            continue
        }
        if i > 0 && nums[i] == nums[i-1] && visited[i-1] == 0 {
            continue
        }
        visited[i] = 1
        stack.append(nums[i])
        permuteUniqueHelper(nums, &visited, &stack, &res)
        visited[i] = 0
        stack.popLast()
    }
}