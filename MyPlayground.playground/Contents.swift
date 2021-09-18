import UIKit

class Solution {
    func sortArrayByParity(_ var nums: [Int]) -> [Int] {
        var nums = nums
        var i = 0 // odd
        var j = nums.count - 1 //even
        while i<j {
            while(nums[i] & 1 == 0 && i < j) {
                i += 1
            }
            while(nums[j] & 1 != 0 && j > i) {
                j -= 1
            }
            
            if i < j {
                nums.swapAt(i, j)
            }
        }
        return nums
    }
}

print(Solution().sortArrayByParity([3,1,2,4]))
print(Solution().sortArrayByParity([0]))
