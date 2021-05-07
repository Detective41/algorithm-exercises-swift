func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    guard n > 0 else {
        return
    }
    guard m > 0 else {
        nums1 = nums2
        return
    }
    
    var i = m - 1, j = n - 1, p = m + n - 1
    while i >= 0 && j >= 0 {
        if nums1[i] >= nums2[j] {
            nums1[p] = nums1[i]
            i -= 1
            p -= 1
        } else {
            nums1[p] = nums2[j]
            j -= 1
            p -= 1
        }
    }
    while i >= 0 {
        nums1[p] = nums1[i]
        i -= 1
        p -= 1
    }
    while j >= 0 {
        nums1[p] = nums2[j]
        j -= 1
        p -= 1
    }
}