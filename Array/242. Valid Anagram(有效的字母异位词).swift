func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else {
        return false
    }
    
    var dict:[Character:Int] = [:]
    for c in s {
        if dict.keys.contains(c) {
            let count = dict[c]
            dict[c] = count! + 1
        } else {
            dict[c] = 1
        }
    }
    for c in t {
        if !dict.keys.contains(c) {
            return false
        } else {
            let count = dict[c]
            if count == 0 {
                return false
            } else {
                dict[c] = count! - 1
            }
        }
    }
    return true
}