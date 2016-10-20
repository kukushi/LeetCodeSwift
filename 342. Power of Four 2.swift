import Foundation

class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        if num < 1 {
            return false
        } else if num == 1 {
            return true
        }
        return (num & (num - 1) == 0) && (num & 1431655765 != 0)
    }
}
