func maxArea(_ height: [Int]) -> Int {
    var i = 0, j = height.count - 1, res = 0
    while i < j {
        let area = min(height[i], height[j]) * (j - i)
        res =  max(res, area)
        if height[i] > height[j] {
            j -= 1
        } else {
            i += 1
        }
    }
    return res
}