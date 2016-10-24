class Solution {
    func isUgly(_ num: Int) -> Bool {
        if num <= 0 {
            return false
        }
        
        var i = num
        while i & 1 == 0 {
            i >>= 1
        }
        while i % 3 == 0 {
            i /= 3
        }
        while i % 5 == 0 {
            i /= 5
        }
        return i == 1
    }
}
