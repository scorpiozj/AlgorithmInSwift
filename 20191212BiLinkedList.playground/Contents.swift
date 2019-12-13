import Foundation

/**
 链表节点
 */
class ZZHNode<T>: CustomStringConvertible{
    var value: T
    var next: ZZHNode?
    weak var previous: ZZHNode?

    init(value: T) {
        self.value = value
    }
    
    var description: String{
        return String(describing: value)
    }
}
/**
 双向链表
 
 */
class ZZHBiLinkedList<T> {
    typealias Node =  ZZHNode<T>
    private var _header: Node?
    private var _tail:Node?
    private var _count: Int = 0
    
    public var isEmpty: Bool {
        return _count == 0
    }
    public var count: Int {
        return _count
    }
    
    public var first: Node? {
        return _header
    }
    
    public var last: Node? {
        return _tail
    }
    
    public func nodeAt(index: UInt, fromStart: Bool) -> Node?{
        guard !isEmpty || index >= _count else {
            return nil
        }
        var tmp: UInt = 0
        var node: Node? = fromStart ? _header : _tail
        while tmp < index {
            if fromStart {
                node = node?.next
            }else {
                node = node?.previous
            }
            tmp += 1
        }
        return node
    }
    
    public subscript(index: UInt) -> Node? {
        return nodeAt(index: index, fromStart: true)
    }
    
    public func insert(node: Node, at index: UInt){
        if isEmpty && index == 0 {
            _header = node
            _tail = node
            node.next = nil
            node.previous = nil
        }else if index == 0 {
            node.next = _header
            _header?.previous = node
            _header = node
            node.previous = nil
        } else if index == _count  {
            node.previous = _tail
            _tail?.next = node
            _tail = node
            node.next = nil
        }else {
            guard let tmp = nodeAt(index: index, fromStart: true) else {
                return
            }
            node.previous = tmp.previous
            tmp.previous?.next = node
            node.next = tmp
            tmp.previous = node
        }
        _count += 1
    }
    public func removeAll() {
        _header = nil
        _tail = nil
        _count = 0
    }
    
    public func removeNodeAt(index: UInt) -> Node? {
        guard !(isEmpty || index >= _count) else {
            return nil
        }
        var tmp:Node?
        if index == 0 {
            tmp = _header
            _header?.next?.previous = nil
            _header = _header?.next
            
        } else if index == _count - 1 {
            tmp = _tail
            _tail?.previous?.next = nil
            _tail = _tail?.previous
        }else {
            tmp = nodeAt(index: index, fromStart: true)
            print("\(index): \(String(describing: tmp?.description))")
            tmp?.previous?.next = tmp?.next
            tmp?.next?.previous = tmp?.previous
        }
        _count -= 1
        return tmp
    }
    
    func printList(_ fromStart: Bool){
        var s = "["
        let connector = fromStart ? "->" : "<-"
        var node = fromStart ? _header : _tail
        while node != nil {
            s += "\(node!.value)"
            node = fromStart ? node!.next : node!.previous
            if node != nil {
                s += "\(connector)"
            }
        }
        s += "]"
        print(s)
    }
}

extension ZZHBiLinkedList: CustomStringConvertible {
    var description: String {
        var s = "["
          var node = _header
          while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += " " }
          }
          return s + "]"
    }
}



var biLinkedList = ZZHBiLinkedList<Int>()
biLinkedList

biLinkedList.insert(node: ZZHNode(value: 1), at: 0)
biLinkedList.count
biLinkedList.insert(node: ZZHNode(value: 2), at: 1)
biLinkedList
biLinkedList.insert(node: ZZHNode(value: 2), at: 4)
biLinkedList.insert(node: ZZHNode(value: 3), at: 2)
biLinkedList.insert(node: ZZHNode(value: 0), at: 0)
biLinkedList.count
biLinkedList.printList(true)
biLinkedList.printList(false)


biLinkedList.nodeAt(index: 0, fromStart: true)
biLinkedList.nodeAt(index: 1, fromStart: true)
biLinkedList.nodeAt(index: 3, fromStart: true)
biLinkedList.nodeAt(index: 4, fromStart: true)
biLinkedList.count
biLinkedList.printList(true)
biLinkedList.printList(false)
print("remove testing")
biLinkedList.isEmpty
biLinkedList.removeNodeAt(index: 6)
biLinkedList.removeNodeAt(index: 4)
biLinkedList.count
biLinkedList.removeNodeAt(index: 1)
biLinkedList.count
print("after remove at index 1")
biLinkedList.printList(true)
biLinkedList.printList(false)

biLinkedList.removeNodeAt(index: 3)
print("after remove at index 3")
biLinkedList.printList(true)
biLinkedList.printList(false)

biLinkedList.removeNodeAt(index: 0)
print("after remove at index 0")
biLinkedList.printList(true)
biLinkedList.printList(false)
