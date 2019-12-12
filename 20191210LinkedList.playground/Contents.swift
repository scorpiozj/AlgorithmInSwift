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
    
    public func nodeAt(index: Int) -> Node? {
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
    
    public subscript(index: Int) -> Node? {
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
    
    public func insert(node: Node, at index: Int){
        if index == 0 {
            node.next = _header?.next
            _header = node
        }else{
            guard let tmpNode = nodeAt(index: index - 1) else {
                return
            }
            node.next = tmpNode.next
            tmpNode.next = node
        }
    }
    
    public func removeAll() {
        _header = nil
        _count = 0
    }
    
    public func removeNodeAt(index: Int){
        if isEmpty || index > _count {
            return
        }else {
            if index == 0 {
                _header = _header?.next
            }else {
                let preNode = nodeAt(index: index - 1)
                preNode?.next = preNode?.next?.next
            }
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
linkedList.first
linkedList.last

linkedList.append(value: 1)
linkedList.append(value: 2)
linkedList.append(node: ZZHNode(value: 3))

linkedList.count
linkedList.isEmpty
linkedList.first
linkedList.last

linkedList.nodeAt(index: 0)
linkedList.nodeAt(index: 3)
linkedList[2]

linkedList.removeNodeAt(index: 5)
linkedList.removeNodeAt(index: 1)
linkedList.removeNodeAt(index: 0)
linkedList.removeNodeAt(index: 0)
