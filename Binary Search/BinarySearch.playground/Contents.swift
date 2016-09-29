//: Playground - noun: a place where people can play

import Cocoa

public func binarySearch(start: Int, end: Int, list: Array<Int>, elementToSearch: Int) -> Int {
  if end >= start {
    let midIndex =  (start + end)/2
    if list[midIndex] == elementToSearch {
      return midIndex
    } else if list[midIndex] > elementToSearch {
      return binarySearch(start: start, end: midIndex - 1, list: list, elementToSearch: elementToSearch)
    } else {
      return binarySearch(start: midIndex + 1, end: end, list: list, elementToSearch: elementToSearch)
    }
  } else {
    return -1
  }
}

let list = [1,2,3,4,5,6,7,8,9]
print(binarySearch(start: 0, end: list.count - 1, list: list, elementToSearch: 9))
