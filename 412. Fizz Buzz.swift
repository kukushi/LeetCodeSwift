class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var strs = [String]()
        for i in 1...n {
            if i % 3 == 0 {
                if i % 5 == 0 {
                    strs.append("FizzBuzz")
                } else {
                    strs.append("Fizz")
                }
            } else if i % 5 == 0 {
                strs.append("Buzz")
            } else {
                strs.append(String(i))
            }
        }
        return strs
    }
}