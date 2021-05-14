func letterCombinations(_ digits: String) -> [String] {
    if digits.count == 0 {
        return []
    }
    
    let dic: [Character:String] = ["2":"abc", "3":"def", "4":"ghi", "5":"jkl", "6":"mno", "7":"pqrs", "8":"tuv", "9":"wxyz"]
    var res: [String] = []
    var str: String = ""
    letterCombinationHelper(Array(digits), dic, 0, &str, &res)
    return res
}

func letterCombinationHelper(_ digits : [Character], _ dic: [Character:String], _ index: Int, _ str: inout String, _ res: inout [String]) {
    if index == digits.count {
        res.append(str)
        return
    }
    
    let character = digits[index]
    let strArr: String = dic[character]!
    let charArr = Array(strArr)
    for i in 0..<charArr.count {
        str.append(charArr[i])
        letterCombinationHelper(digits, dic, index+1, &str, &res)
        str.removeLast()
    }
}