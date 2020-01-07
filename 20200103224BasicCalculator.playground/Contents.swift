import Foundation
class ZZHStack<T> {
    
    private var array = [T]()
    var size: Int {
        get {
            return self.array.count
        }
    }
    
    var isEmpty: Bool {
        get {
            return self.array.count == 0
        }
    }
    func push(value: T) {
        self.array.append(value)
    }
    
    func pop() -> T? {
        let last = self.array.removeLast()
        return last
    }
    func peek() -> T? {
        return array.last
    }
    
}

extension ZZHStack: CustomStringConvertible{
    var description: String {
        get {
            return self.array.description
        }
    }
    
}
/**
 Implement a basic calculator to evaluate a simple expression string.

 The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces .

 Example 1:

 Input: "1 + 1"
 Output: 2
 Example 2:

 Input: " 2-1 + 2 "
 Output: 3
 Example 3:

 Input: "(1+(4+5+2)-3)+(6+8)"
 Output: 23
 Note:
 You may assume that the given expression is always valid.
 Do not use the eval built-in library function.

 思路：
 考虑到h只包含+-h运算和括号，可以考虑把所有的计算转化成+。
 初始化 num = 0，result=0，sign=1
 纯数字情况下：
 1. 遇到数字，赋给num--这里需要注意连续数字的情况处理
 2. 遇到+/-，先把当前的num和sign运算后，加到result上；保存sign并置num为0
 有括号的情况下，展开括号，得出不含括号时当前数字前的运算符。此时，需要使用栈来保存当前的运算符。
 1. 遇到左括号，将当前sign压栈
 2. 遇到右括号，弹出栈
 3. 遇到数字，赋给num--同样注意连续数字的情况处理
 4. 遇到+/-，先把当前的num和sign运算后，加到result上；保存sign：当前的sign为下一个操作数准备，需要当前操作符和栈顶操作符共同确定sign值，并置num为0
 */

class Solution {
    func calculate(_ s: String) -> Int {
        let operatorStack = ZZHStack<Int>()
        var result = 0
        var operands = 0
        var sign = 1
        operatorStack.push(value: sign)
        for ch in s {
//            print("\(ch)")
//            print("\(operatorStack.description)")
//            print("\(numStack.description)")
            switch ch {
            case "(":
                operatorStack.push(value: sign)
            case ")":
                operatorStack.pop()
//                print("\(operatorStack.description)")
//                print("\(numStack.description)")
            case "+", "-":
                result = result + sign * operands
                sign = ((ch == "+") ? 1 : -1) * operatorStack.peek()!
                operands = 0
            case " ":
                continue
            default:
                operands = operands * 10 + ch.wholeNumberValue!
                
            }
        }
        
        return result + sign * operands
    }
}

let sol = Solution()
sol.calculate("1-12+3-9")
sol.calculate("23")
sol.calculate("3-(2-1)")
sol.calculate("(10-(4+5+2)-3)+(6+8)")

sol.calculate("1+3-2+4-9+1")
