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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre = head
        var next = head?.next
        while next != nil {
            let newNext = next?.next
            next?.next = pre
            
            pre = next
            next = newNext
        }
        head?.next = nil
        return pre
    }
}
