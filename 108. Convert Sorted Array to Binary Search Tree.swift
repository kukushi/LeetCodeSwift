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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return buildBalancedBST(nums, 0, nums.count - 1)
    }
    
    func buildBalancedBST(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        if end < start {
            return nil
        }
        
        let mid = start + (end - start) / 2
        let treeNode = TreeNode(nums[mid])
        if mid > start {
            treeNode.left = buildBalancedBST(nums, start, mid - 1)
        }
        if mid < end {
            treeNode.right = buildBalancedBST(nums, mid + 1, end)
        }
        return treeNode
    }
}