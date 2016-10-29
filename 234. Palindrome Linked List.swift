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
    func isPalindrome(_ head: ListNode?) -> Bool {
//        var len = 0
//        var it = head
//        while it != nil {
//            len += 1
//            it = it?.next
//        }
//        
//        let pivot = len / 2 + len % 2
//        var offset = 0
//        
//        var secondPart = head
//        while offset != pivot {
//            secondPart = secondPart?.next
//            offset += 1
//        }
        
        var fast = head
        var slow = head
        while fast != nil && slow != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        var secondPart = reverseList(slow)
        var it = head

        while secondPart != nil {
            if it?.val != secondPart?.val {
                return false
            }
            
            it = it?.next
            secondPart = secondPart?.next
        }
        
        return true
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