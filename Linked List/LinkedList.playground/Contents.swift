//: Playground - noun: a place where people can play

import Cocoa

public class Node<T> {
  var data: T
  var next: Node?
  
  init(data:T) {
    self.data = data
    self.next = nil
  }
}

public class LinkedList<T> {
  
  var head: Node<T>?
  
  init() {
    self.head = nil
  }
  
  
  /// This prints all elements of the linked list.
  public func printList() {
    if var node = head {
      print(node.data)
      while node.next != nil {
        node = node.next!
        print(node.data)
      }
    }
  }
  
  
  /// Inserts a node at the front of the linked list.
  public func push(data: T) {
    let newNode = Node(data: data)
    newNode.next = self.head
    self.head = newNode
  }
  
  
  /// Returns the first node.
  public var first: Node<T>? {
    get {
      if let headNode = head {
        return headNode
      }else {
        return nil
      }
    }
  }
  
  
  /// Returns the last node.
  public var last: Node<T>? {
    get {
      if var node = head {
        while node.next != nil {
          node = node.next!
        }
        return node
      }else {
        return nil
      }
    }
  }
  
  /// Inserts a new node after the given node.
  public func insertAfter(prevNode: Node<T>, node: Node<T>) {
    let prevNextNode = prevNode.next
    prevNode.next = node
    guard let nextNode = prevNextNode else {
      return
    }
    node.next = nextNode
  }

}

let ll = LinkedList<Int>()
let first = Node(data: 1)
let second = Node(data: 2)
let third = Node(data: 3)

ll.head = first
ll.head?.next = second
second.next = third

let newNode = Node(data: 10)
ll.insertAfter(second, node: newNode)

ll.head?.data   // 1

ll.printList()  /* 1
                   2
                   10
                   3 */

ll.first!.data // 1
ll.last!.data  // 3
