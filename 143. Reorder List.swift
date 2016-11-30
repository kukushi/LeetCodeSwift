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
    func reorderList(_ head: ListNode?) {
        if head == nil {
            return
        }
        
        var fast = head
        var slow = head
        var count = 0
        
        while fast != nil && slow != nil {
            fast = fast?.next?.next
            slow = slow?.next
            count += 1
        }
        
        // Rever
        var reversed = reverseList(slow);
        
        var it = head;
        while it != nil && reversed != nil && count != 0 {
            let next = it?.next
            let reversedNext = reversed?.next
            
            it?.next = reversed
            reversed?.next = next
            
            reversed = reversedNext
            it = next
            
            count -= 1
        }
        it?.next = nil
        return
    }
    
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