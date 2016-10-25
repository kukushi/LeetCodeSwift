class Solution {
    func rob(_ nums: [Int]) -> Int {
        let count = nums.count
        if count == 0 {
            return 0
        }
        if count == 1 {
            return nums.first!
        }
        var r = Array<Int>(repeatElement(0, count: count))
        r[0] = nums[0]
        r[1] = max(r[0], nums[1])
        for i in 2..<nums.count {
            r[i] = max(r[i - 1], nums[i] + r[i - 2])
        }
        return r[count - 1]
    }
}
