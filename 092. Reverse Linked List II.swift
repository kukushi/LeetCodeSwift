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
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        let offset = n - m
        if offset == 0 {
            return head
        }
        
        let start: ListNode? = ListNode(0)
        start?.next = head
        
        var it = start
        var begin = m - 1
        while begin != 0 {
            it = it?.next
            begin -= 1
        }
        
        it?.next = reverse(node: it?.next, offset: offset)
        return start?.next
    }
    
    func reverse(node: ListNode?, offset: Int) -> ListNode? {
        var it = node?.next
        var pre = node
        var n = offset
        while it != nil && n != 0 {
            let next = it?.next
            it?.next = pre
            
            pre = it
            it = next
            
            n -= 1
        }
        if it != nil {
            node?.next = it
        } else {
            node?.next = nil
        }
        return pre
    }
}