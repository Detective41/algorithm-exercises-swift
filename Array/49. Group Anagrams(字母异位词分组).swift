func groupAnagrams(_ strs: [String]) -> [[String]] {
    guard strs.count > 0 else {
        return []
    }
    
    var res: [[String]] = []
    var dic: [[Character]:[String]] = [:]
    for s in strs {
        if dic[s.sorted()] != nil {
            var value = dic[s.sorted()]
            value?.append(s)
            dic[s.sorted()] = value
        } else {
            dic[s.sorted()] = [s]
        }
    }
    for arr in dic.values {
        res.append(arr)
    }
    return res
}