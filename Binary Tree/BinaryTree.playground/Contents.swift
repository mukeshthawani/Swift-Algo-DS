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
  
  /// This returns height of the Binary tree.
  public func height(node: Node<T>?) -> Int {
    guard let node = node else {
      return 0
    }
    return (1 + max(height(node: node.left), height(node: node.right)))
  }
  
  /// This returns diameter of the Binary tree.
  public func diameter(node: Node<T>?) -> Int {
    guard let node = node else {
      return 0
    }
    let leftHeight = height(node: node.left)
    let rightHeight = height(node: node.right)
    
    return max(diameter(node: node.left), diameter(node: node.right), (1 + leftHeight + rightHeight))
  }
  
  public func description(node: Node<T>?) -> String{
    guard  let node = node else {
      return ""
    }
    return ("value: " + "\(node.data), " + "left: " + "[\(description(node: node.left))], " + "right: " + "[\(description(node: node.right))]")
  }
}

let root = Node<Int>(data: 1)
root.left = Node<Int>(data: 2)
root.right = Node<Int>(data: 3)
root.left?.right = Node<Int>(data: 7)
root.left?.right?.right = Node<Int>(data: 8)
root.left?.right?.right?.right = Node<Int>(data: 9)
root.left?.left = Node<Int>(data: 4)
root.left?.left?.left = Node<Int>(data: 5)

let binaryTree = BinaryTree<Int>()
print(binaryTree.height(node: root))                   // 5
print(binaryTree.diameter(node: root))                 // 6

print(binaryTree.description(node: root))              /* value: 1, left: [value: 2, left: [value: 4, left: [value: 5, left: [], right: []], right: 
                                                          []], right: [value: 7, left: [], right: [value: 8, left: [], right: [value: 9, left: [],
                                                          right: []]]]], right: [value: 3, left: [], right: []] */
