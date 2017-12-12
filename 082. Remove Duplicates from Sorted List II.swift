/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }

        let fakeHead = ListNode(-1)
        fakeHead.next = head

        var pre: ListNode? = fakeHead
        var current = head

        while current != nil {
            while current?.next != nil && current?.val == current?.next?.val {
                current = current?.next
            }

            if pre?.next === current {
                pre = pre?.next
            } else {
                pre?.next = current?.next
            }

            current = current?.next
        }

        return fakeHead.next
    }
}
