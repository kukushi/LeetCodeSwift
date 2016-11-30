# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def detectCycle(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        if head is None:
            return None

        fast = head
        slow = head
        while fast and slow:
            fast = fast.next

            if fast is None:
                return None
            else:
                fast = fast.next

            slow = slow.next

            if fast == slow:
                while fast != head:
                    head = head.next
                    fast = fast.next
                return head
        return None
