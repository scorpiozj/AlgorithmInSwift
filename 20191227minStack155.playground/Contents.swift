import Foundation

class MinStack {
    private var array = [Int]()
    private var minArray = [Int]()
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        array.append(x)
        if minArray.last == nil || minArray.last! > x {
            minArray.append(x)
        }
        
        //print("push:\(array)\n \(minArray)")
    }
    
    func pop() {
        let poped = array.removeLast()
        if poped == minArray.last {
            minArray.removeLast()
        }
        //print("pop:\(array)\n \(minArray)")
    }
    
    func top() -> Int {
        return array.last!
    }
    
    func getMin() -> Int {
        return minArray.last!
    }
}

extension MinStack: CustomStringConvertible{
    var description: String{
        if array.count > 0 {
           // return "array:\(arr.description)\nsorted:\(sortedArray!.description)"
            return "array:\(array.description)"
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

