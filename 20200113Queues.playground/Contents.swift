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

