//大根堆思路
func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        guard arr.count != 0 && k != 0 else {
            return []
        }

        var heap: [Int] = []
        heap = buildHeap(arr, k)//先将前K个元素组合成一个大顶堆
        for i in k..<arr.count {//再将下标k以后的元素依次与堆顶元素比较，若比堆顶元素大则跳过，否则替换堆顶元素
            insert(&heap, arr[i])
        }
        return heap
    }

    func buildHeap(_ arr: [Int], _ k: Int) -> [Int] {
        var heap: [Int] = []
        for i in 0..<k {
            heap.append(arr[i])
        }
        let j = (k-1)/2 //从(k-1)/2的位置开始堆化，因为从(k-1)/2+1到末尾的数都是叶子节点
        for i in (0...j).reversed() {//新建一个大顶堆
            heapify(&heap, i)
        }
        return heap
    }

    func heapify(_ arr: inout [Int], _ index: Int) {
        var index = index
        while true {
            var maxPos = index
            if 2*index+1 < arr.count && arr[index] < arr[2*index+1] {
                maxPos = 2*index+1
            }
            if 2*index+2 < arr.count && arr[maxPos] < arr[2*index+2] {
                maxPos = 2*index+2
            }
            if maxPos == index {
                break
            }
            arr.swapAt(index, maxPos)
            index = maxPos
        }
    }

    func insert(_ arr: inout [Int], _ num: Int) {
        if num >= arr[0] {
            return
        }
        
        arr[0] = num
        let j = (arr.count-1)/2
        for i in (0...j).reversed() {
            heapify(&arr, i)
        }
    }