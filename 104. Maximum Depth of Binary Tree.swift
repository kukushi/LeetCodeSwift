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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return findDeep(node: root, depth: 1)
    }
    
    func findDeep(node: TreeNode, depth: Int) -> Int {
        var ld = -1
        var rd =  -1
        if let lv = node.left {
            ld = findDeep(node: lv, depth: depth + 1)
        }
        if let rv = node.right {
            rd = findDeep(node: rv, depth: depth + 1)
        }
        
        let maxDeep = max(ld, rd)
        return maxDeep == -1 ? depth : maxDeep
    }
}
