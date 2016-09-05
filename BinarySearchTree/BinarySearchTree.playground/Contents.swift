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
  
  public func hasRightChild() -> Bool {
    return (self.right != nil)
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

extension BinarySearchTree {
  
  public func insert(key: T) -> T?{
    let data = insertKey(node: self, key: key)
    return data
  }
  
  /// Inserts a key at a leaf node.
  private func insertKey(node: BinarySearchTree?, key: T) -> T? {
    guard let node = node else {
      return nil
    }
      if key < node.data {
        
        // check if the left node is empty then add the new node.
        if let left = node.left {
          return insertKey(node: left, key: key)
        } else {
          node.left = BinarySearchTree(data: key)
          return node.left?.data
        }
      } else {
        
        // check if the right node is empty then add the new node.
        if let right = node.right {
          return insertKey(node: right, key: key)
        } else {
          node.right = BinarySearchTree(data: key)
          return node.right?.data
        }
      }
  }
}

let binTree = BinarySearchTree<Int>(data: 3)
binTree.left = BinarySearchTree<Int>(data: 2)
binTree.left?.left = BinarySearchTree<Int>(data: 1)
binTree.right = BinarySearchTree<Int>(data: 4)
binTree.right?.right = BinarySearchTree<Int>(data: 5)
print(binTree.search(key: 5)?.data)                       // 5

print(binTree.insert(key: 6))                             // 6
print(binTree.right?.right?.right?.data)                  // 6
print(binTree.hasRightChild())                            // true
