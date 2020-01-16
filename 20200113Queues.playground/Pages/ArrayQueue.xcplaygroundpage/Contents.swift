import Foundation

protocol ZZHQueue {
    associatedtype Element
    var isEmpty: Bool{
        get
    }
    var size: Int {
        get
    }
    var peek: Element? {
        get
    }
    
    func enqueue(nElement: Element) -> Bool
    func dequeue() -> Element?
}

class ZZHArrayQueue<Element>: ZZHQueue {
    private var array:[Element]
    private var capacity: Int
    private var head = 0
    private var tail = 0
    
    init(_ capacity: Int, defaultElement: Element) {
        self.capacity = capacity
        array = [Element](repeating: defaultElement, count: capacity)
    }
    var isEmpty: Bool{
        get{
//            return array.isEmpty
            return tail == head
        }
    }
    
    var size: Int {
        get {
//            return array.count
            return tail - head
        }
    }
    
    var peek: Element?{
        if isEmpty {
            return nil
        }else {
            return array[head]
        }
    }
    //循环调整队列
    func enqueue(nElement: Element) -> Bool {
        if size == capacity {
            return false
        }
        //移动数据
        if head != 0 {
            
            for index in head..<tail {
                array[index - head] = array[index]
            }
            tail = tail - head
            head = 0
        }
        
        array[tail] = nElement
        tail += 1
        return true
    }
    //直接入队，不搬移元素
    func enqueue2(nElement: Element) -> Bool {
        if tail == capacity {
            return false
        }
        array.append(nElement)
        tail += 1
        return true
    }
    
    func dequeue() -> Element? {
        if isEmpty {
            return nil
        }else {
            let obj = array[head]
            head += 1
            return obj
        }
    }
}

extension ZZHArrayQueue: CustomDebugStringConvertible{
    var debugDescription: String{
        if head > tail{
            return "should not happen"
        }
        if head == tail {
            return "empty"
        }
        var str = ""
        
        for index in head..<tail {
            str += "\(array[index])->"
            
        }
        str += "\nhead:\(head) tail:\(tail)"
        return str
    }
}

var arrayQueue = ZZHArrayQueue(3, defaultElement: -1)
arrayQueue.isEmpty
arrayQueue.size
arrayQueue.enqueue(nElement: 2)
debugPrint(arrayQueue)
arrayQueue.enqueue(nElement: 3)
arrayQueue.enqueue(nElement: 4)
arrayQueue.enqueue(nElement: 5)
debugPrint(arrayQueue)
arrayQueue.dequeue()
debugPrint(arrayQueue)
arrayQueue.dequeue()
debugPrint(arrayQueue)
arrayQueue.size
arrayQueue.enqueue(nElement: 7)
debugPrint(arrayQueue)
arrayQueue.dequeue()
debugPrint(arrayQueue)
arrayQueue.dequeue()
arrayQueue.dequeue()
arrayQueue.dequeue()
debugPrint(arrayQueue)


/**
 Value of type '[Element]' has no subscripts generic type
 The issue isn't so much about subscripting. It's about type conversion. Swift gave a misleading error message. Take a look at this line:
 https://stackoverflow.com/a/35244984/371974
 */
//: [Next](@CycleQueue)
