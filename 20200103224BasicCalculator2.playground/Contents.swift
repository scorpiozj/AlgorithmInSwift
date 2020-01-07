import Foundation
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

 没有括号的情况下：
 1. 遇到数字压栈
 2. 遇到操作符，如果操作栈为空，则压入该操作符；否则，将当前操作栈内的元素pop，并结合数字栈的内容进行计算，计算结果压入数字栈，最后再将操作符压入操作符栈
 有括号的情形：
 数字直接压入数字栈
 （压入操作符栈
 ）：不入栈，处理操作符栈，直到遇到 （
 +/-：操作符栈空或最后为（时，压入操作符栈；否则，处理操作符栈直到遇到（，最后压入操作符栈
 
 检查操作符栈，有内容的话，继续操作。
 */
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
class Solution {
    func calculate(_ s: String) -> Int {
        let operatorStack = ZZHStack<Character>()
        let numStack = ZZHStack<Int>()
        var isPreNum = false
        for ch in s {
//            print("\(ch)")
//            print("\(operatorStack.description)")
//            print("\(numStack.description)")
            switch ch {
            case "(":
                isPreNum = false
                operatorStack.push(value: ch)
            case ")":
                isPreNum = false
                var ope = (operatorStack.pop())!
                while ope != "(" && operatorStack.isEmpty == false {
                    let lastNum = numStack.pop()!
                    let lastSecond = numStack.pop()!
                    if ope == "-" {
                        numStack.push(value: lastSecond - lastNum)
                    }else {
                        numStack.push(value: lastSecond + lastNum)
                    }
                    ope = operatorStack.pop()!
                }
            case "+", "-":
                isPreNum = false
                if operatorStack.isEmpty == true || operatorStack.peek()! == "(" {
                    operatorStack.push(value: ch)
                }else {
                    while operatorStack.isEmpty == false && operatorStack.peek()! != "(" {
                        let ope = operatorStack.pop()!
                        let lastNum = numStack.pop()!
                        let lastSecond = numStack.pop()!
                        let result = ope == "+" ? (lastSecond + lastNum) : (lastSecond - lastNum)
                        numStack.push(value: result)
                        
                    }
                    operatorStack.push(value: ch)
                }
            case " ":
                isPreNum = false
                continue
            default:
                if isPreNum {
                    numStack.push(value: ch.wholeNumberValue! + numStack.pop()! * 10)
                }else {
                    numStack.push(value: ch.wholeNumberValue!)
                }
                isPreNum = true
            }
        }
        while operatorStack.isEmpty == false {
            let ope = (operatorStack.pop())!
            let lastNum = numStack.pop()!
            let lastSecond = numStack.pop()!
            if ope == "-" {
                numStack.push(value: lastSecond - lastNum)
            }else {
                numStack.push(value: lastSecond + lastNum)
            }
        }
        return (numStack.peek())!
        
    }
}

let sol = Solution()
sol.calculate("(10+(4+5+2)-3)+(6+8)")
sol.calculate("23")
