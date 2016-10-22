class Solution {
    func countAndSay(_ n: Int) -> String {
        var str = "1"
        var it = n
        while it > 1 {
            str = iterate(str)
            it -= 1
        }
        return str
    }
    
    func iterate(_ str: String) -> String {
        var result = ""
        let characters = str.characters
        var pre = characters.first!
        
        var first = true
        var count = 1
        
        for char in characters {
            if first {
                first = false
                continue
            }
            
            if pre == char {
                count += 1
            } else {
                result += String(count)
                result.append(pre)
                
                pre = char
                count = 1
            }
        }
        
        result += String(count)
        result.append(pre)
        
        return result
    }
}
class Solution {
    func countAndSay(_ n: Int) -> String {
        var str = "1"
        var it = n
        while it > 1 {
            str = iterate(str)
            it -= 1
        }
        return str
    }
    
    func iterate(_ str: String) -> String {
        var result = ""
        let characters = str.characters
        var pre = characters.first!
        
        var first = true
        var count = 1
        
        for char in characters {
            if first {
                first = false
                continue
            }
            
            if pre == char {
                count += 1
            } else {
                result += String(count)
                result.append(pre)
                
                pre = char
                count = 1
            }
        }
        
        result += String(count)
        result.append(pre)
        
        return result
    }
}