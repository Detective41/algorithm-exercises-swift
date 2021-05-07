//Method 1
func moveZeroes(_ nums: inout [Int]) {
   var i = 0
   for j in 0..<nums.count {
       if nums[j] != 0 {//查找不为0的元素
           let temp = nums[i]
           nums[i] = nums[j]
           nums[j] = temp
           i += 1
       }
   }
}

//Method 2
func moveZeroes(_ nums: inout [Int]) {
   var i = 0
    for j in 0..<nums.count {
        if nums[j] != 0 {
            if i != j {
                nums[i] = nums[j]
                nums[j] = 0
            }
            i += 1
        }
    }
}