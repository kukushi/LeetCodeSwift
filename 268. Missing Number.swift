import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0) {
            $0 + $1
        }
        let count = nums.count
        let wantedSum = count * (count + 1) / 2
        return wantedSum - sum
    }
    
    func missingNumber2(_ nums: [Int]) -> Int {
        let count = nums.count
        var result = count
        for i in 0..<count {
            result ^= i
            result ^= nums[i]
        }
        return result
    }
}