func subsets(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    var stack: [Int] = []
    subsetsHelper(0, nums, &stack, &res)
    return res
}

func subsetsHelper(_ start: Int, _ nums: [Int], _ stack: inout [Int], _ res: inout [[Int]]) {
    if start >= nums.count {
        res.append(stack)
        return
    }
    
    stack.append(nums[start])
    subsetsHelper(start+1, nums, &stack, &res)
    stack.popLast()
    subsetsHelper(start+1, nums, &stack, &res)
}