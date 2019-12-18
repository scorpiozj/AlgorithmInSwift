import Foundation

class ZZHStack<T> {
    private var capacity: Int
    private var array: Array<T>?
    var size: Int {
        get {
            return self.array!.count
        }
    }
    init(capacity: Int) {
        self.capacity = capacity
        self.array = Array()
    }
    
    func push(value: T) -> Bool {
        if array!.count < capacity {
            self.array?.append(value)
            return true
        }
        return false
    }
    
    func pop() -> T? {
        let last = self.array?.removeLast()
        return last
    }
    func peek() -> T? {
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

var stack = ZZHStack<Int>(capacity: 2)
stack.push(value: 2)
stack.push(value: 0)
print("stack:\n\(stack)")
stack.push(value: 0)
print("stack:\n\(stack)")
let first = stack.peek()
let a = stack.pop()
print("\(a)")
print("stack:\n\(stack)")
