func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else {
        return []
    }
    
    let arr = nums.sorted()
    var res:[[Int]] = [], l = 0, r = 0
    for i in 0..<arr.count {
        if arr[i] > 0 {
            return res
        }
        if i > 0 && arr[i] == arr[i-1] {//去重
            continue
        }
        l = i + 1
        r = arr.count - 1
        while l < r {
            if arr[i] + arr[l] + arr[r] == 0 {
                res.append([arr[i], arr[l], arr[r]])
                while l < r && arr[l] == arr[l+1] {//去重
                    l += 1
                }
                while l < r && arr[r] == arr[r-1] {//去重
                    r -= 1
                }
                l += 1
                r -= 1
            } else if arr[i] + arr[l] + arr[r] < 0 {
                l += 1
            } else {
                r -= 1
            }
        }
        
    }
    return res
}