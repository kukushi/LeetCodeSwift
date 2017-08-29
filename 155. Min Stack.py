class MinStack(object):

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.stk_list = []
        self.min_stk = []
        

    def push(self, x):
        """
        :type x: int
        :rtype: void
        """
        self.stk_list.append(x)
        if len(self.min_stk) == 0 or x <= self.min_stk[-1]:
            self.min_stk.append(x)

    def pop(self):
        """
        :rtype: void
        """
        r = self.stk_list.pop()
        if self.min_stk[-1] == r:
            self.min_stk.pop()

    def top(self):
        """
        :rtype: int
        """
        return self.stk_list[-1]

    def getMin(self):
        """
        :rtype: int
        """
        return self.min_stk[-1]/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = new MinStack();
 * obj.push(x);
 * obj.pop();
 * int param_3 = obj.top();
 * int param_4 = obj.getMin();
 */