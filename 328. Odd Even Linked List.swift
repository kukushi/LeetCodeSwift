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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var odd = head
        var even = head?.next
        let evenHead = even
        var lastOdd = odd
        
        while odd != nil || even != nil {
            let oddNext = odd?.next?.next
            let evenNext = even?.next?.next
            
            odd?.next = oddNext
            even?.next = evenNext
            
            if odd != nil {
                lastOdd = odd
            }
            
            odd = oddNext
            even = evenNext
        }
        
        lastOdd?.next = evenHead
        return head
    }
}