class MinStack {
    var stack:[(Int, Int)] = []//(当前元素，栈的最小元素)
    /** initialize your data structure here. */
    init() {

    }
    
    func push(_ val: Int) {
        if let last = stack.last?.1 {//栈顶元祖维护最小的元素
            stack.append((val, min(last, val)))
        } else {
            stack.append((val, val))
        }
    }
    
    func pop() {
        stack.popLast()
    }
    
    func top() -> Int {
        return stack.last!.0
    }
    
    func getMin() -> Int {
        return stack.last!.1
    }
}