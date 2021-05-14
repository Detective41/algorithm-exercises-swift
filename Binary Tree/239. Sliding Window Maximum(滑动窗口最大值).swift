func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count != 0 && k != 0 else {
            return []
        }
    
        var res: [Int] = []
        var heap: [(Int, Int)] = []//(元素值, 元素索引)
        let k = k >= nums.count ? nums.count : k
        heap = buildHeap(nums, k)//先将前K个元素组合成一个大顶堆
        res.append(heap[0].0)//取出堆顶元素
        for i in k..<nums.count {
            while heap.count > 0 && heap[0].1 + k <= i {//若栈顶元素不在窗口内，则将元素从堆删除
                removeMax(&heap)
            }
            insert(&heap, nums[i], i)//插入新的元素
            res.append(heap[0].0)
        }
        return res
    }

    func buildHeap(_ arr: [Int], _ k: Int) -> [(Int, Int)] {
        var heap: [(Int,Int)] = []
        for i in 0..<k {
            heap.append((arr[i], i))
        }
        let j = (k-1)/2 //从(k-1)/2的位置开始堆化，因为从(k-1)/2+1到末尾的数都是叶子节点，不需要处理
        for i in (0...j).reversed() {//新建一个大顶堆
            heapify(&heap, i)
        }
        return heap
    }

    func heapify(_ arr: inout [(Int, Int)], _ index: Int) {
        var index = index
        while true {
            var maxPos = index
            if 2*index+1 < arr.count && arr[index].0 < arr[2*index+1].0 {
                maxPos = 2*index+1
            }
            if 2*index+2 < arr.count && arr[maxPos].0 < arr[2*index+2].0 {
                maxPos = 2*index+2
            }
            if maxPos == index {
                break
            }
            arr.swapAt(index, maxPos)
            index = maxPos
        }
    }

    func removeMax(_ heap: inout [(Int, Int)]) {
        let last = heap.popLast()
        if heap.count == 0 {
            heap = []
        } else {
            heap[0] = last!
            let j = (heap.count-1)/2 //从(heap.count-1)/2的位置开始堆化，因为从(heap.count-1)/2+1到末尾的数都是叶子节点，不需要处理
            for i in (0...j).reversed() {//新建一个大顶堆
                heapify(&heap, i)
            }
        }
    }

    func insert(_ heap: inout [(Int, Int)], _ num: Int, _ index: Int) {
        heap.append((num, index))
        let j = (heap.count-1)/2 //从(heap.count-1)/2的位置开始堆化，因为从(heap.count-1)/2+1到末尾的数都是叶子节点，不需要处理
        for i in (0...j).reversed() {//新建一个大顶堆
            heapify(&heap, i)
        }
    }