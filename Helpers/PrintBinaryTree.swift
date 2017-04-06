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

// A useful function to print binary tree
func printTree(node: TreeNode?) {
    func printNode(prefix: String, node: TreeNode?, isLeft: Bool) {
        guard let node = node else {
            return
        }
        print(prefix + (isLeft ? "|-- " : "\\ --") + "\(node.val)" )
        printNode(prefix: prefix + (isLeft ? "|   " : "    "), node: node.left, isLeft: true)
        printNode(prefix: prefix + (isLeft ? "|   " : "    "), node: node.right, isLeft: false)
    }
    
    guard let node = node else {
        return
    }
    
    printNode(prefix: "", node: node, isLeft: false)
}