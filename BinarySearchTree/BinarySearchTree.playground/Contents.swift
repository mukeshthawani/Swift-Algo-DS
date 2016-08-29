//: Playground - noun: a place where people can play

import Cocoa

public class Node<T> {
  var left: Node?
  var right: Node?
  var data: T
  
  init(data: T) {
    self.data = data
  }
}