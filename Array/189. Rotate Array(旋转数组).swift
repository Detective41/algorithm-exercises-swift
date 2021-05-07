func rotate(_ nums: inout [Int], _ k: Int) {
    if k < 0 {
        return
    }
    let n = k % nums.count
    reverse(&nums, 0, nums.count-1)
    reverse(&nums, 0, n-1)
    reverse(&nums, n, nums.count-1)
}

func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
    guard start >= 0 && start < nums.count && end >= 0 && end < nums.count else {
        return
    }
    
    var start = start
    var end = end
    while start < end {
        let value = nums[start]
        nums[start] = nums[end]
        nums[end] = value
        start += 1
        end -= 1
    }
}