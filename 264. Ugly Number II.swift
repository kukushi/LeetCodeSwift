// The naive approach is to call isUgly for every number until you reach the nth one. Most numbers are not ugly. Try to focus your effort on generating only the ugly ones.
// An ugly number must be multiplied by either 2, 3, or 5 from a smaller ugly number.
// The key is how to maintain the order of the ugly numbers. Try a similar approach of merging from three sorted lists: L1, L2, and L3.
// Assume you have Uk, the kth ugly number. Then Uk+1 must be Min(L1 * 2, L2 * 3, L3 * 5).

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var pointer1 = 0
        var pointer2 = 0
        var pointer3 = 0
        
        var result = [1]
        for _ in 0..<n-1 {
            let a = result[pointer1] * 2
            let b = result[pointer2] * 3
            let c = result[pointer3] * 5
            let ugly = min(min(a, b), c)
            if ugly == a {
                pointer1 += 1
            }
            if ugly == b {
                pointer2 += 1
            }
            if ugly == c {
                pointer3 += 1
            }
            result.append(ugly)
        }
        return result.last!
    }
}
