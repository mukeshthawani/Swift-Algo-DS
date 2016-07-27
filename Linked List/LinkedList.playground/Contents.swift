//: Playground - noun: a place where people can play

import Cocoa

public class Node<T> {
    
    var data:T
    var next:Node?
    
    init(data:T) {
        self.data = data
        self.next = nil
    }
}

public class LinkedList<T> {
    
    var head:Node<T>?
    
    init() {
        self.head = nil
    }
    
    func printList() {
        var currentNode = head
        while (currentNode != nil) {
            print((currentNode?.data)!,"\n")
            currentNode = currentNode?.next
        }
    }
    
    
    func push(data:T) {
        let newNode = Node(data: data)
        
        newNode.next = self.head
        
        self.head = newNode
    }
}

let ll = LinkedList<Int>()
let first = Node(data: 1)
let second = Node(data: 2)
let third = Node(data: 3)

ll.head = first
ll.head?.next = second
second.next = third

ll.head?.data
ll.printList()
