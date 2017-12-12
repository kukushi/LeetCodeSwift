/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func recursiveFlatten(_ root: TreeNode?) -> (head: TreeNode?, tail: TreeNode?) {
        if root == nil {
            return (nil, nil)
        }
        var leftHead, leftTail: TreeNode?
        if let left = root?.left {
            (leftHead, leftTail) = recursiveFlatten(left)
        }
        var rightHead, rightTail: TreeNode?
        if let right = root?.right {
            (rightHead, rightTail) = recursiveFlatten(right)
        }

        var current = root
        var tail = root
        if leftHead != nil {
            current?.right = leftHead
            current = leftTail
            tail = leftTail
        }
        if rightHead != nil {
            current?.right = rightHead
            current = rightHead
            tail = rightTail
        }
        root?.left = nil
        return (root, tail)
    }

    func flatten(_ root: TreeNode?) {
        _ = recursiveFlatten(root)
    }
}