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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return height(of: root).1
    }
    
    func height(of node: TreeNode?) -> (Int, Bool) {
        guard let node = node else {
            return (0, true)
        }
        let (leftHeight, leftBalanced) = height(of: node.left)
        let (rightHeight, rightBalanced) = height(of: node.right)
        return (max(leftHeight, rightHeight) + 1, leftBalanced && rightBalanced && abs(leftHeight - rightHeight) < 2)
    }
}