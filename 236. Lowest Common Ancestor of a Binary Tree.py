# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution(object):
    def lowestCommonAncestor(self, root, p, q):
        """
        :type root: TreeNode
        :type p: TreeNode
        :type q: TreeNode
        :rtype: TreeNode
        """
        paths = [None] * 2
        self.searchPaths(root, [], paths, p, q)
        path1 = paths[0]
        path2 = paths[1]
        path_len = min(len(path1), len(path2))

        result = root
        for i in range(0, path_len):
            if path1[i] == path2[i]:
                result = path1[i]
            else:
                break
        return result

    def searchPaths(self, node, current_path, paths, p, q):
        if node is None:
            return

        current_path.append(node)
        
        if node == p:
            paths[0] = list(current_path)
        elif node == q:
            paths[1] = list(current_path)

        if paths[1] is not None and paths[0] is not None:
            return
        
        self.searchPaths(node.left, current_path, paths, p, q)
        self.searchPaths(node.right, current_path, paths, p, q)
        current_path.pop()