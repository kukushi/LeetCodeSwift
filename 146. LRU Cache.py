class Node(object):
    def __init__(self, key, value):
        self.key = key
        self.value = value
        self.pre = None
        self.next = None


class LRUCache(object):

    def __init__(self, capacity):
        """
        :type capacity: int
        """
        self.capacity = capacity
        self.map = {}
        self.head = Node(-1, -1)
        self.tail = self.head
        self.count = 0

    def get(self, key):
        """
        :rtype: int
        """
        if key in self.map:
            node = self.map[key]
            if node != self.tail:
                node.pre.next = node.next
                node.next.pre = node.pre
                self.tail.next = node
                node.pre = self.tail
                self.tail = node
            return node.value
        return -1

    def set(self, key, value):
        """
        :type key: int
        :type value: int
        :rtype: nothing
        """

        if self.capacity == 0:
            return

        if key in self.map:
            node = self.map[key]
            if node != self.tail:
                node.pre.next = node.next
                node.next.pre = node.pre
                self.tail.next = node
                node.pre = self.tail
                self.tail = node
            node.value = value
        else:
            node = Node(key, value)
            self.map[key] = node
            self.tail.next = node
            node.pre = self.tail

            self.tail = node

            self.count += 1
            if self.count > self.capacity:
                remove_node = self.head.next
                self.head.next = remove_node.next
                remove_node.next.pre = self.head
                self.map.pop(remove_node.key, None)
                self.count -= 1