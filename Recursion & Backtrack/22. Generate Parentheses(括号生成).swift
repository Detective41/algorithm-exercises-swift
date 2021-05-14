var res: [String] = []
func generateParenthesis(_ n: Int) -> [String] {
    process(0, 0, n, "")
    return res
}

func process(_ left: Int, _ right: Int, _ n: Int, _ str: String) {
    if left == n && right == n {
        res.append(str)
        return
    }
    if left < n {
        process(left + 1, right, n, str + "(")
    }
    if right < left {
        process(left, right + 1, n, str + ")")
    }
}