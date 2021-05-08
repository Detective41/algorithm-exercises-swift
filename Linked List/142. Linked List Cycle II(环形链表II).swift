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

func detectCycle(_ head: ListNode?) -> ListNode? {
    var slow = head, fast = head
    while fast?.next != nil {
        slow = slow?.next//一次走1步
        fast = fast?.next?.next//一次走2步
        if slow === fast {//slow与fast第一次相遇
            fast = head//fast重新指向链表头
            while fast !== slow {
                fast = fast?.next
                slow = slow?.next
            }
            return fast
        }
    }
    return nil
}