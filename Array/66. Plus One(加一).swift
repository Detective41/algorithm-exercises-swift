func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    for i in (0..<digits.count).reversed() {
        if digits[i] + 1 < 10 {
            digits[i] += 1
            return digits
        }
        digits[i] = 0
    }
    digits = Array(repeating: 0, count: digits.count + 1)
    digits[0] = 1
    
    return digits
}