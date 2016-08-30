//: Playground - noun: a place where people can play

import Cocoa

public class BinarySearchTree<T: Comparable> {
  
  var parent: BinarySearchTree?
  var left: BinarySearchTree?
  var right: BinarySearchTree?
  var data: T
  
  init(data: T) {
    self.data = data
  }
}

extension BinarySearchTree {
  
  public func search(key: T) -> BinarySearchTree? {
    var node: BinarySearchTree? = self
    while case let n? = node {
      if key < n.data {
        node = n.left
      }
      else if key > n.data {
        node = n.right
      }
      else {
        return node
      }
    }
    return nil
  }
}

let binTree = BinarySearchTree<Int>(data: 3)
binTree.left?.data = 2
binTree.left?.left?.data = 1
binTree.right?.data = 4
binTree.right?.right?.data = 5
print(binTree.search(key: 1))