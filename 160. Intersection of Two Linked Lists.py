import gc

class Solution(object):
    def getIntersectionNode(self, headA, headB):
        """
        :type head1, head1: ListNode
        :rtype: ListNode
        """
        if headA is None or headB is None:
            return None

        lengthA = self.getLength(headA)
        lengthB = self.getLength(headB)

        curA = headA
        curB = headB

        if lengthA > lengthB:
            offset = lengthA - lengthB
            while offset:
                curA = curA.next
                offset -= 1
        elif lengthB > lengthA:
            offset = lengthB - lengthA
            while offset:
                curB = curB.next
                offset -= 1

        while curA and curB:
            if curA == curB:
                gc.collect()
                return curA
            curA = curA.next
            curB = curB.next

        gc.collect()
        return None


    def getLength(self, head):
        len = 0
        next = head
        while next:
            len += 1
            next = next.next
        return len