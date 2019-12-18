import Foundation

class ZZHStack {
    private var capacity: Int
    private var array: Array<Any>?
    var size: Int {
        get {
            return self.array!.count
        }
    }
    init(capacity: Int) {
        self.capacity = capacity
        self.array = Array()
    }
    
    func push(value: Any) -> Bool {
        if array!.count < capacity {
            self.array?.append(value)
            return true
        }
        return false
    }
    
    func pop() -> Any? {
        let last = self.array?.removeLast()
        return last
    }
    func peek() -> Any? {
        return array?.last
    }
    
}

extension ZZHStack: CustomStringConvertible {
    var description: String {
        var s = "stack bottom"
        for element in self.array! {
            s += "\n" + String(describing: element)
        }
        s += "\nstack top"
        return s
    }
}

var stack = ZZHStack(capacity: 2)
stack.push(value: 2)
stack.push(value: "0")
print("stack:\n\(stack)")
stack.push(value: "3")
print("stack:\n\(stack)")
let first = stack.peek()
let a = stack.pop()
print(a as Any)
print("stack:\n\(stack)")
