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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        return morrisInorder(root: root)
    }
    
    func morrisInorder(root: TreeNode?) -> [Int] {
        var result = [Int]()
        guard let root = root else {
            return result
        }
        
        var cur :TreeNode? = root
        while cur != nil {
            let left = cur?.left
            if left == nil {
                result.append(cur!.val)
                cur = cur?.right
            } else {
                var pre: TreeNode? = cur?.left
                while pre?.right != nil && pre?.right?.val != cur?.val {
                    pre = pre?.right
                }
                
                if pre?.right != nil {
                    pre?.right = nil
                    result.append(cur!.val)
                    cur = cur?.right
                } else {
                    pre?.right = cur
                    cur = cur?.left
                }
            }
        }
        return result
    }
}