# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

from random import randint
import sys


class Solution(object):

    def __init__(self, head):
        """
        @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node.
        :type head: ListNode
        """
        self.head = head

    def getRandom(self):
        """
        Returns a random node's value.
        :rtype: int
        """
        n = randint(0,sys.maxsize)
        k = 0
        it = self.head
        while n and it:
            it = it.next
            n -= 1
            k += 1

        if n == 0:
            return it.val
        else:
            n = n % k
            it = self.head
            while n and it:
                it = it.next
                n -= 1
            return it.val