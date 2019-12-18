import Foundation

class ZZHNode<T>: CustomStringConvertible{
    var value: T
    var next: ZZHNode?

    init(value: T) {
        self.value = value
    }
    
    var description: String{
        return String(describing: value)
    }
}
/**
 单向链表
 1. count/isEmpty
 2. first/last
 3. subscript; get
 4. add/remove
 5. enum
 */
class ZZHLinkedList<T> {
    typealias Node =  ZZHNode<T>
    
    fileprivate var _header: Node?
    fileprivate var _count: Int = 0
    
    public var isEmpty: Bool {
        get {
            return _count == 0
        }
    }
    
    public var count: Int {
        get {
            return _count
        }
    }
    
    public var first: Node? {
        return _header
    }
    
    public var last: Node? {
        get {
            guard var node = _header else {
                return nil
            }
            while  let next = node.next {
                node = next
            }
            return node
        }
    }
    
    public func nodeAt(index: UInt) -> Node? {
        if isEmpty || index > _count {
            return nil
        }else {
            var num = 0
            var node = _header
            while num < index {
                node = node?.next
                num += 1
            }
            return node
        }
        
    }
    
    public subscript(index: UInt) -> Node? {
        return nodeAt(index: index)
    }
    
    public func append(value: T) {
        let tempNode = Node(value: value)
        if let node = last {
            node.next = tempNode
        }else {
            _header = tempNode
        }
        _count += 1
    }
    public func append(node: Node) {
        if let tmpNode = last {
            tmpNode.next = node
        }else {
            _header = node
        }
        _count += 1
    }
    
    public func insert(node: Node, at index: UInt){
        if index == 0 {
            node.next = _header
            _header = node
            _count += 1
        }else{
            guard let tmpNode = nodeAt(index: index - 1) else {
                return
            }
            node.next = tmpNode.next
            tmpNode.next = node
            _count += 1
        }
        
    }
    
    public func removeAll() {
        _header = nil
        _count = 0
    }
    
    public func removeNodeAt(index: UInt) -> Node?{
        if isEmpty || index >= _count {
            return nil
        }else {
            var tmp:Node?
            if index == 0 {
                tmp = _header
                _header = _header?.next
            }else {
                let preNode = nodeAt(index: index - 1)
                tmp = preNode?.next
                preNode?.next = preNode?.next?.next
            }
            _count -= 1
            return tmp
        }
    }
}

extension ZZHLinkedList: CustomStringConvertible {
    public var description: String {
      var s = "["
      var node = _header
      while node != nil {
        s += "\(node!.value)"
        node = node!.next
        if node != nil { s += " -> " }
      }
      return s + "]"
    }
}

let linkedList = ZZHLinkedList<Int>()
linkedList.count
linkedList.isEmpty
linkedList.last
linkedList.nodeAt(index: 2)

linkedList.append(value: 1)
linkedList.append(value: 2)
linkedList.append(node: ZZHNode(value: 3))
linkedList.append(node: ZZHNode(value: 4))

linkedList.count
linkedList.isEmpty
linkedList.first
linkedList.last

linkedList.nodeAt(index: 0)
linkedList.nodeAt(index: 3)
linkedList.nodeAt(index: 4)
linkedList[2]

linkedList.count
linkedList
linkedList.removeNodeAt(index: 5)
linkedList
linkedList.removeNodeAt(index: 3)
linkedList
linkedList.count
linkedList.removeNodeAt(index: 1)
linkedList
linkedList.removeNodeAt(index: 0)
linkedList
linkedList.count
linkedList.removeNodeAt(index: 0)
linkedList

linkedList.insert(node: ZZHNode(value: 9), at: 1)
linkedList.count
linkedList.insert(node: ZZHNode(value: 9), at: 0)
linkedList.insert(node: ZZHNode(value: 8), at: 1)
linkedList.count
linkedList.insert(node: ZZHNode(value: 7), at: 0)
linkedList.count








