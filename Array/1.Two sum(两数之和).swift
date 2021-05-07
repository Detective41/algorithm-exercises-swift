func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict:[Int:Int] = [:]
    for (index, value) in nums.enumerated() {
        let other = dict[target-value]
        if other != nil {
            return [index, other!]
        }
        dict[value] = index
    }
    return []
}