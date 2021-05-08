func isValid(_ s: String) -> Bool {
    guard s.count > 0 else {
        return false
    }
    
    var arr: [Character] = []
    for c in s {
        if c == "(" {
            arr.append(")")
        } else if c == "{" {
            arr.append("}")
        } else if c == "[" {
            arr.append("]")
        } else if c != arr.popLast() {
            return false
        }
    }
    return arr.isEmpty
}
