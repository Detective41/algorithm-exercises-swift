public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1, l2 = l2, newList: ListNode = ListNode(-1)
    var temp = newList
    while l1 != nil && l2 != nil {
        if (l1?.val)! < (l2?.val)! {
            temp.next = l1
            l1 = l1?.next
        } else {
            temp.next = l2
            l2 = l2?.next
        }
        temp = temp.next!
    }
    temp.next = l1 ?? l2
    
    return newList.next
}