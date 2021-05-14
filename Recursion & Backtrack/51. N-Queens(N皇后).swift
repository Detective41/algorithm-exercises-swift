func solveNQueens(_ n: Int) -> [[String]] {
    var res: [[String]] = []
    var columns: Set<Int> = []//列
    var diagonal1: Set<Int> = []//方向从左上到右下的对角线
    var diagonal2: Set<Int> = []//方向从右上到左下的对角线
    var arr: [Int] = Array(repeating: -1, count: n)//储存每行可以放置皇后位置的下标
    queueHelper(n, 0, &columns, &diagonal1, &diagonal2, &arr, &res)
    return res
}

func queueHelper(_ n: Int, _ row: Int, _ columns: inout Set<Int>, _ diagonal1: inout Set<Int>, _ diagonal2: inout Set<Int>, _ arr: inout [Int], _ res: inout [[String]]) {
    if row == n {
        res.append(generateBoard(arr))
        return
    }
    //每次遍历一行对应都要遍历所有列
    for i in 0..<n {
        if columns.contains(i) {//一列最多只能有一个Queue
            continue
        }
        if diagonal1.contains(row-i) {//一条对角线最多只能有一个Queue
            continue
        }
        if diagonal2.contains(row+i) {//一条对角线最多只能有一个Queue
            continue
        }
        arr[row] = i
        columns.insert(i)
        diagonal1.insert(row-i)
        diagonal2.insert(row+i)
        queueHelper(n, row+1, &columns, &diagonal1, &diagonal2, &arr, &res)
        arr[row] = -1
        columns.remove(i)
        diagonal1.remove(row-i)
        diagonal2.remove(row+i)
    }
}

func generateBoard(_ arr: [Int]) -> [String] {
    var board: [String] = []
    for i in 0..<arr.count {
        var temp: [Character] = Array(repeating: ".", count: arr.count)
        if arr[i] >= 0 {
            temp[arr[i]] = "Q"
        }
        board.append(String(temp))
    }
    return board
}