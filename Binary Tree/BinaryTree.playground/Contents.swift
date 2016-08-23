//: Playground - noun: a place where people can play

import Cocoa

class Node<T> {
  var left: Node<T>? = nil
  var right: Node<T>? = nil
  var data: T
  
  init(data: T) {
    self.data = data
  }
}

