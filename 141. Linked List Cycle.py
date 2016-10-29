# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

# Solution 1: Reverse the list, if the the reversed tail is head, it has circle.
class Solution(object):
    def hasCycle(self, head):
        """
        :type head: ListNode
        :rtype: bool
        """
        if head is None:
            return False

        pre = head
        next_node = head.next

        if next_node is None:
            return False

        while next_node:
            newNext = next_node.next

            if newNext is not None and newNext == head:
                return True

            next_node.next = pre
            pre = next_node
            next_node = newNext

        return pre == head

# Solution 2: Use two pointers, one slow pointer iterate one step, one fast pointer iterate two steps, if they lay, there is a circle.
class Solution2(object):
    def hasCycle(self, head):
        """
        :type head: ListNode
        :rtype: bool
        """
        if head is None:
            return False

        fast = head
        slow = head
        while fast and slow:
            fast = fast.next

            if fast is None:
                return False
            else:
                fast = fast.next

            slow = slow.next

            if fast == slow:
                return True
        return False