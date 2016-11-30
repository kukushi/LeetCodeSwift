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
        
        var previousValue = head?.val
        var previousPointer = head
        var next = head
        var first = true
        
        while next != nil {
            
            if first {
                first = false
                continue
            }
            
            if next?.val == previousValue {
                previousPointer?.next = next?.next
            } else {
                previousValue = next?.val
                previousPointer = next
            }
            
            next = next?.next
        }
        return head
    }
}