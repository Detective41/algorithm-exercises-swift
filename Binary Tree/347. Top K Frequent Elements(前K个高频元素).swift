func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count != 0 else {
            return []
        }
    
        var dic: [Int:Int] = [:]
        for i in 0..<nums.count {
            if dic[nums[i]] != nil {
                let count = dic[nums[i]]
                dic[nums[i]] = count! + 1
            } else {
                dic[nums[i]] = 1
            }
        }
        
        var temp: [(Int, Int)] = []//[元素:个数]
        for key in dic.keys {
            let count = dic[key]
            temp.append((key, count!))
        }
        
        var heap = buildHeap(temp, k)//[元素:个数]
        for i in k..<temp.count {
            insert(&heap, temp[i].0, temp[i].1)
        }
        var res: [Int] = []
        for element in heap {
            res.append(element.0)
        }
        return res
    }

    func buildHeap(_ arr: [(Int, Int)], _ k: Int) -> [(Int, Int)] {
        var heap: [(Int,Int)] = []
        for i in 0..<k {
            heap.append((arr[i].0, arr[i].1))
        }
        let j = (k-1)/2 //从(k-1)/2的位置开始堆化，因为从(k-1)/2+1到末尾的数都是叶子节点，不需要处理
        for i in (0...j).reversed() {//新建一个小顶堆
            heapify(&heap, i)
        }
        return heap
    }

    func heapify(_ arr: inout [(Int, Int)], _ index: Int) {
        var index = index
        while true {
            var minPos = index
            if 2*index+1 < arr.count && arr[index].1 > arr[2*index+1].1 {
                minPos = 2*index+1
            }
            if 2*index+2 < arr.count && arr[minPos].1 > arr[2*index+2].1 {
                minPos = 2*index+2
            }
            if minPos == index {
                break
            }
            arr.swapAt(index, minPos)
            index = minPos
        }
    }

    func insert(_ heap: inout [(Int, Int)], _ num: Int, _ count: Int) {
        if count <= heap[0].1 {//若元素比栈顶元素小，则忽略该元素；若比栈顶元素大，则替换栈顶元素
            return
        }
        heap[0] = (num, count)
        let j = (heap.count-1)/2
        for i in (0...j).reversed() {
            heapify(&heap, i)
        }
    }