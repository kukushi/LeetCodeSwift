import Foundation

class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        
        if num < 0 {
            return false
        }
        
        var zeroCount = 0
        var oneCount = 0
        
        var value = num
        repeat {
            if value & 1 == 1 {
                oneCount += 1
            } else {
                zeroCount += 1
            }
            value = value >> 1
        } while (value != 0)
        return oneCount == 1 && zeroCount % 2 == 0
    }
}
