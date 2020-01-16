//: [Previous](@previous)

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

class ZZHCycleQueue<Element>: ZZHQueue {
    private var array: [Element]
    private var capacity: Int
    private var head = 0
    private var tail = 0
    private var len = 0 //防止浪费空间
    
    init(_ capacity: Int, defaultElement: Element) {
        self.capacity = capacity
        array = [Element](repeating: defaultElement, count: capacity)
    }
    var isEmpty: Bool{
        return 0 == len
//        return head == tail
        
    }
    
    var size: Int{
        return len
    }
    
    var peek: Element? {
        if isEmpty {
            return nil
        }else {
            return array[head]
        }
    }
    
    func enqueue(nElement: Element) -> Bool {
        if len == capacity {
            return false
        }else {
            array[tail] = nElement
            tail = (tail + 1) % capacity
            len += 1
            return true
        }
    }
    
    func dequeue() -> Element? {
        if isEmpty {
            return nil
        }else {
            let obj = array[head]
            head = (head + 1) % capacity
            len -= 1
            return obj
        }
        
    }
    
    func printQueue()  {
        if isEmpty {
            print("empty")
        }else {
            var str = ""
            if head >= tail{
                for index in head..<(tail+capacity) {
                    str += "\(array[index%capacity])->"
                }
            }else {
                for index in head..<tail {
                    str += "\(array[index%capacity])->"
                }
            }
            
            print(str)
        }
    }
}

var queue = ZZHCycleQueue(5, defaultElement: -1)
queue.printQueue()
queue.enqueue(nElement: 1)
queue.enqueue(nElement: 2)
queue.enqueue(nElement: 3)
queue.printQueue()
queue.enqueue(nElement: 4)
queue.enqueue(nElement: 5)
queue.printQueue()
queue.enqueue(nElement: 6)
queue.printQueue()
queue.dequeue()
queue.printQueue()
queue.enqueue(nElement: 7)
queue.printQueue()
queue.dequeue()
queue.dequeue()
queue.dequeue()
queue.printQueue()
queue.enqueue(nElement: 8)
queue.printQueue()
queue.dequeue()
queue.dequeue()
queue.dequeue()
queue.dequeue()
queue.printQueue()
//: [Next](@next)
