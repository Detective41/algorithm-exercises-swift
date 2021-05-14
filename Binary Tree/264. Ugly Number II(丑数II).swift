func nthUglyNumber(_ n: Int) -> Int {
        let factor = [2,3,5]
        var res = 1
        var set: Set<Int> = [1]
        var heap = buildHeap(set)
        for _ in 1...n {
            res = removeMin(&heap)
            for j in 0..<factor.count {
                if set.insert(res*factor[j]).inserted {
                    insert(&heap, res*factor[j])
                }
            }
        }
        return res
    }

    func buildHeap(_ set: Set<Int>) -> [Int] {
        var heap: [Int] = []
        for value in set.sorted() {
            heap.append(value)
        }
        let j = (set.count-1)/2//从(k-1)/2的位置开始堆化，因为从(k-1)/2+1到末尾的数都是叶子节点，不需要处理
        for i in (0...j).reversed() {//新建一个小顶堆
            heapify(&heap, i)
        }
        return heap
    }

    func heapify(_ arr: inout [Int], _ index: Int) {
        var index = index
        while true {
            var minPos = index
            if 2*index+1 < arr.count && arr[index] > arr[2*index+1] {
                minPos = 2*index+1
            }
            if 2*index+2 < arr.count && arr[minPos] > arr[2*index+2] {
                minPos = 2*index+2
            }
            if minPos == index {
                break
            }
            arr.swapAt(index, minPos)
            index = minPos
        }
    }

    func insert(_ arr: inout [Int], _ num: Int) {
        arr.append(num)
        let j = (arr.count-1)/2
        for i in (0...j).reversed() {
            heapify(&arr, i)
        }
    }

    func removeMin(_ arr: inout [Int]) -> Int {
        let min = arr[0]
        let last = arr.popLast()
        if arr.count > 0 {
            arr[0] = last!
            let j = (arr.count-1)/2
            for i in (0...j).reversed() {
                heapify(&arr, i)
            }
        }
        return min
    }