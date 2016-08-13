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

public class LinkedList<T> where T: Comparable {
  
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
  public func push(_ newNode: Node<T>) {
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
  
  /// Returns the number of nodes.
  public var count: Int {
    get {
      guard let head = self.head else {
        return 0
      }
      return getCount(head)
    }
  }
  
  /// Get count recursively.
  private func getCount(_ node: Node<T>) -> Int{
    guard let next = node.next else {
      return 1
    }
    return getCount(next) + 1
  }
  
  /// Inserts a new node after the given node.
  public func insertAfter(_ prevNode: Node<T>, node: Node<T>) {
    let prevNextNode = prevNode.next
    prevNode.next = node
    guard let nextNode = prevNextNode else {
      return
    }
    node.next = nextNode
  }
  
  /// Deletes the given node.
  public func deleteNode(_ node: Node<T>) -> T? {
    var prev: Node<T>
    var temp: Node<T>
    guard let head = head else {
      return nil
    }
    temp = head
    guard temp.data != node.data else {
      self.head = node.next
      node.next = nil
      return node.data
    }
    while temp.next != nil {
      prev = temp
      temp = temp.next!
      if temp.data == node.data {
        prev.next = node.next
        node.next = nil
        return node.data
      }
    }
    return nil
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

ll.head?.data                                 // 1

ll.count                                      // 4
let newList = LinkedList<Int>()
newList.count                                 // 0

ll.printList()                                /* 1
                                                 2
                                                 10
                                                 3 */

ll.deleteNode(second)                         // 2
ll.deleteNode(first)                          // 1

ll.printList()                                /* 10
                                                 3 */
 
ll.head?.data                                 // 10
ll.first!.data                                // 10
ll.last!.data                                 // 3