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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let start = ListNode(0)
        start.next = head
        
        var it = head
        var pre: ListNode? = start
        while it != nil {
            if it?.val == val {
                pre?.next = it?.next
            } else {
                pre = it
            }
            it = it?.next
        }
        return start.next
    }
}