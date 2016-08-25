//: Playground - noun: a place where people can play

import Cocoa

public class Node<T> {
  var left: Node<T>? = nil
  var right: Node<T>? = nil
  var data: T
  
  init(data: T) {
    self.data = data
  }
}

public class BinaryTree<T> where T: Comparable {
  
  public func height(node: Node<T>?) -> Int {
    guard let node = node else {
      return 0
    }
    return (1 + max(height(node: node.left), height(node: node.right)))
  }
}

let root = Node<Int>(data: 1)
root.left = Node<Int>(data: 2)
root.right = Node<Int>(data: 3)
root.left?.left = Node<Int>(data: 4)
root.left?.left?.left = Node<Int>(data: 5)

let binaryTree = BinaryTree<Int>()
print(binaryTree.height(node: root))                   // 4
