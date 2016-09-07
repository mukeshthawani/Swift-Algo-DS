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
  
  public func hasBothChildren() -> Bool {
    return (right != nil && left != nil)
  }

  public func hasRightChild() -> Bool {
    return (right != nil)
  }

  public func hasLeftChild() -> Bool {
    return (left != nil)
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

extension BinarySearchTree {

  func deleteNode(node: BinarySearchTree?, key: T) -> T? {
    guard let node = node else {
      return nil
    }
    let parent = node.parent
    if node.data == key {
      if node.hasLeftChild() && node.hasRightChild() {
        // Has both the children
        
        let successor = findSuccessor(node: node.right!)
        // Remove successor from its earlier position.
        successor.parent?.left = nil
        
        // Move both the childrens of node to be deleted to its successor.
        successor.left = node.left
        successor.right = node.right
    
        // If node to be deleted is left child of its parent then its successor will replace that position.
        if parent?.left?.data == node.data {
          parent?.left = successor
        } else {
          parent?.right = successor
        }
        return node.data
        
      } else if node.hasLeftChild() || node.hasRightChild() {
        // Has only one child
        
        let nodeToTransfer: BinarySearchTree
        
        // Check which node to move.
        if node.hasLeftChild() {
          nodeToTransfer = node.left!
        } else {
          nodeToTransfer = node.right!
        }
        
        // Update to new position.
        if parent?.left?.data == node.data {
          parent?.left = nodeToTransfer
        } else {
          parent?.right = nodeToTransfer
        }
        return node.data
      } else {

        // leaf
        if parent?.left?.data == node.data {
          parent?.left = nil
        } else {
          parent?.right = nil
        }
        return node.data
      }
    } else {
      if key > node.data {
        node.right?.parent = node
        return deleteNode(node: node.right, key: key)
      } else {
        node.left?.parent = node
        return deleteNode(node: node.left, key: key)
      }
    }
  }
  
  private func findSuccessor(node: BinarySearchTree) -> BinarySearchTree {
    guard let leftNode = node.left else {
      return node
    }
    leftNode.parent = node
    return findSuccessor(node: leftNode)
  }
}

let binTree = BinarySearchTree<Int>(data: 3)
binTree.left = BinarySearchTree<Int>(data: 2)
binTree.left?.left = BinarySearchTree<Int>(data: 1)
binTree.right = BinarySearchTree<Int>(data: 7)
binTree.right?.left = BinarySearchTree<Int>(data: 6)
binTree.right?.right = BinarySearchTree<Int>(data: 9)
print(binTree.search(key: 5)?.data)                       // 5

//print(binTree.insert(key: 6))                             // 6
print(binTree.right?.right?.right?.data)                  // 6
print(binTree.hasRightChild())                            // true
print(binTree.hasLeftChild())                             // true
print(binTree.deleteNode(node: binTree, key: 7))
print(binTree.right?.data)