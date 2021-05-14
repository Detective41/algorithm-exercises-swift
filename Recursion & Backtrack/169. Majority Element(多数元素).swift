func majorityElement(_ nums: [Int]) -> Int {
    //摩尔投票法思路
    var target = nums[0], count = 1
    for i in 1..<nums.count {
        if nums[i] == target {
            count += 1
        } else {
            count -= 1
            if count == 0 {
                target = nums[i]
                count = 1
            }
        }
    }
    return target
}