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
  
  /// Searches the BinarySearchTree for a given key.
  public func search(key: T) -> BinarySearchTree? {
    var node: BinarySearchTree? = self
    while let n = node {
      if key < n.data {
        node = n.left
      }else if key > n.data {
        node = n.right
      }else {
        return node
      }
    }
    return nil
  }
}

let binTree = BinarySearchTree<Int>(data: 3)
binTree.left = BinarySearchTree<Int>(data: 2)
binTree.left?.left = BinarySearchTree<Int>(data: 1)
binTree.right = BinarySearchTree<Int>(data: 4)
binTree.right?.right = BinarySearchTree<Int>(data: 5)
print(binTree.search(key: 5)?.data)