func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var j = 0
    for i in 0..<nums.count {
        if nums[i] != nums[j] {
            j += 1
            nums[j] = nums[i]
        }
    }
    return j + 1
}