class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let fakeHead1 = ListNode(-1)
        var fakeHead1Current: ListNode? = fakeHead1
        let fakeHead2: ListNode? = ListNode(-1)
        var fakeHead2Current: ListNode? = fakeHead2

        var it = head
        while it != nil {
            if it!.val < x {
                fakeHead1Current?.next = it
                fakeHead1Current = it
            } else {
                fakeHead2Current?.next = it
                fakeHead2Current = it
            }

            it = it?.next
        }

        fakeHead2Current?.next = nil
        fakeHead1Current?.next = fakeHead2?.next
        return fakeHead1.next
    }
}