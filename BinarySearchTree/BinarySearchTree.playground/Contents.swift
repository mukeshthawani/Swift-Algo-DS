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

  public func deleteNode(node: BinarySearchTree?, key: T) -> BinarySearchTree? {
    guard let node = node else {
      return nil
    }
    if node.data == key {
      if node.hasLeftChild() && node.hasRightChild() {
        // When both present.
        
        let successor = findSuccessor(node: node.right!)
        
        // Remove successor from its earlier position.
        deleteNode(node: node, key: successor.data)
        
        // Move both the childrens of node to be deleted to its successor.
        successor.left = node.left
        successor.right = node.right
    
        // If node to be deleted is left child of its parent then its successor will replace that position.
        updateParent(node: node, currentChild: successor)
        return successor
        
      } else if node.hasLeftChild() || node.hasRightChild() {
        
        // Has only one child
        let currentChild = getLeftOrRightChild(node: node)
        updateParent(node: node, currentChild: currentChild!)
        return currentChild
      } else {

        // leaf
        updateParent(node: node, currentChild: nil)
        return nil
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
  
  private func getLeftOrRightChild(node: BinarySearchTree) -> BinarySearchTree? {
    if node.hasLeftChild() {
      return node.left
    } else {
      return node.right
    }
  }
  
  private func updateParent(node: BinarySearchTree, currentChild: BinarySearchTree?) -> BinarySearchTree? {
    
    // Check which node to move.
    let parent = node.parent
    
    // Update to new position.
    if parent?.left?.data == node.data {
      parent?.left = currentChild
    } else {
      parent?.right = currentChild
    }
    return parent
  }
  
  private func findSuccessor(node: BinarySearchTree) -> BinarySearchTree {
    guard let leftNode = node.left else {
      return node
    }
    leftNode.parent = node
    return findSuccessor(node: leftNode)
  }
}

extension BinarySearchTree {
  
  /// Inorder traversal of a given BST.
  public func inorder() {
    let node: BinarySearchTree? = self
    inorderTraversal(node: node)
  }
  
  private func inorderTraversal(node: BinarySearchTree?) {
    guard let node = node else {
      return
    }
    inorderTraversal(node: node.left)
    print(node.data)
    inorderTraversal(node: node.right)
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
let newRoot = binTree.deleteNode(node: binTree, key: 6)
binTree.inorder()