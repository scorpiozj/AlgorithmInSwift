import Foundation

class MinStack {
    private var array: [Int]?
    private var currentMin = 0
    /** initialize your data structure here. */
    init() {
        array = Array()
    }
    
    func push(_ x: Int) {
        if array?.count == 0 {
            currentMin = x
        }else if currentMin > x {
            currentMin = x
        }
        array?.append(x)
        array?.append(currentMin)
        
    }
    
    func pop() {
        array?.removeLast()
        array?.removeLast()
        if let last = array?.last {
            if last > currentMin {
                currentMin = last
            }
            
        }
    }
    
    func top() -> Int {
        let count = array?.count
        if count! > 0 {
            return array![count! - 2]
        }
        return 0
    }
    
    func getMin() -> Int {
        return array?.last ?? 0
    }
}

extension MinStack: CustomStringConvertible{
    var description: String{
        if let arr = array {
           // return "array:\(arr.description)\nsorted:\(sortedArray!.description)"
            return "array:\(arr.description)"
        }else {
            return "empty"
        }
    }
}
/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

let obj = MinStack()
obj.push(-2)
obj.push(0)
obj.push(-3)
obj.getMin()
obj.pop()
obj.top()
obj.getMin()
