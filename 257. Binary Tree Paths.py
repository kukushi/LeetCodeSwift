# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    # @param {TreeNode} root
    # @return {string[]}
    def binaryTreePaths(self, root):
        if not root:
            return []

        results = []
        path = ""
        self.dfsTree(root, results, path)
        return results

    def dfsTree(self, node, results, path):
        if not node:
            return

        path = path + "->" + str(node.val) if len(path) > 0 else str(node.val)

        self.dfsTree(node.left, results, path)

        self.dfsTree(node.right, results, path)

        if node.left is None and node.right is None:
            results.append(path)