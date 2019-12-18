import Foundation

public class ListNode {
   public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }


class Solution {
    /**
     C-style
     memory can be optimized
     */
    func middleNode(_ head: ListNode?) -> ListNode? {
        var list1: ListNode? = head
        var list2: ListNode? = head
        while list2?.next != nil && list2?.next?.next != nil {
            list1 = list1?.next
            list2 = list2?.next?.next
        }
        if (list2?.next) != nil {
            return  list1?.next
        }else {
            return list1
        }
    }
    /**
     速度快
     */
    func middleNode2(_ head: ListNode?) -> ListNode? {
        var list1: ListNode? = head
        var list2: ListNode? = head
//        while (list2?.next != nil) && (list2 != nil) {
//            list1 = list1?.next
//            list2 = list2?.next?.next
//        }
        while let list2Next = list2?.next,  (list2 != nil) {
            list1 = list1?.next
            list2 = list2Next.next
        }
        return list1
    }
}


class Solution2 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while (fast != nil) && (fast?.next != nil) {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}

func middleNode(_ head: ListNode?) -> ListNode? {
    var fast = head
    var slow = head
    while (fast?.next != nil || fast?.next?.next != nil) {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}
