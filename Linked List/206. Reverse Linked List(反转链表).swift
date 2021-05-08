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

//Method1
func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    let newHead = reverseList(head?.next)
    head?.next?.next = head
    head?.next = nil
    return newHead
}

//Method2
func reverseList(_ head: ListNode?) -> ListNode? {
    guard head != nil else {
        return nil
    }

    var prev:ListNode? = nil
    var curr:ListNode? = head
    while curr != nil {
        let next = curr!.next
        curr!.next = prev
        prev = curr
        curr = next
    }
    return prev
}