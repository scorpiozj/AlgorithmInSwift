import Foundation

class MinStack {
    private var array: [Int]?
    private var sortedArray:[Int]?
    /** initialize your data structure here. */
    init() {
        array = Array()
        sortedArray = Array()
    }
    
    func push(_ x: Int) {
        array?.append(x)
        let count = sortedArray!.count
        var index = 0
        for i in 0..<count {
            if (x < sortedArray![i]){
                index = i
                break
            }
            index = i + 1
        }
        sortedArray?.insert(x, at: index)
    }
    
    func pop() {
        let last = array?.removeLast()
        if let poped = last {
            let index = sortedArray?.firstIndex(of: poped)
            sortedArray?.remove(at: index!)
        }
    }
    
    func top() -> Int {
        return array?.last ?? 0
    }
    
    func getMin() -> Int {
        return array?.min() ?? 0
//        return sortedArray?.first ?? 0
    }
}

extension MinStack: CustomStringConvertible{
    var description: String{
        if let arr = array {
            return "array:\(arr.description)\nsorted:\(sortedArray!.description)"
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
