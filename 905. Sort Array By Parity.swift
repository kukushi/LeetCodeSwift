class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var nums = nums
        var i = 0 // odd
        var j = nums.count - 1 //even
        while i<j {
            while(nums[i] & 1 == 0 && i < j) {
                i += 1
            }
            while(nums[j] & 1 != 0 && i < j) {
                j -= 1
            }
            
            if i < j {
                var tmp = nums[j]
                nums[j] = nums[i]
                nums[i] = tmp
                i += 1
                j -= 1
            }
        }
        return nums
    }
}

