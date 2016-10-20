class Solution {
    func addDigits(_ num: Int) -> Int {
        let left = num % 9
        return left == 0 && num != 0 ? 9 : left
    }
}
