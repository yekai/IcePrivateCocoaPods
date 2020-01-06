//
//  File.swift
//  Pods-AA
//
//  Created by LonchIT on 2019/12/31.
//

import Foundation

open class LinkedNode {
    public var value: Int
    public var next: LinkedNode?
    
    public init(value: Int, next: LinkedNode?) {
        self.value = value
        self.next = next
    }
    
    public func printNodes() {
        var node: LinkedNode? = self
        while node != nil {
            print("\(node!.value)")
            node = node!.next
        }
    }
}

open class LinkedNodeGenerator {
    //merge two sorted linked list, return one
    public class func merge(node1: LinkedNode, node2: LinkedNode) -> LinkedNode {
        let isHead = node1.value <= node2.value
        let head = isHead ? node1 : node2
        var tempNode: LinkedNode? = head
        var tail: LinkedNode? = isHead ? node2 : node1
        var midNode: LinkedNode? = isHead ? node1.next : node2.next
        while tempNode != nil  && tail != nil {
            if midNode == nil {
                tempNode!.next = tail
                break
            } else if midNode!.value <= tail!.value {
                tempNode!.next = midNode
                tempNode = midNode
                midNode = midNode!.next
            } else {
                tempNode!.next = tail
                tempNode = tail
                tail = tail!.next
            }
        }
        if midNode != nil {
            if tempNode != nil {
                tempNode!.next = midNode
            }
        }
        return head
    }
    //return the last index of linked node list
    public class func lastIndexFor(node: LinkedNode, lastIndex: Int) -> LinkedNode {
        var first: LinkedNode = node, second: LinkedNode = node
        for _ in 1..<lastIndex {
            second = second.next!
        }
        while second.next != nil {
            first = first.next!
            second = second.next!
        }
        return first
    }
    //analyse whether the linked node list is a loop
    public class func isNodeListLoop(_ node: LinkedNode) -> Bool {
        var first: LinkedNode? = node, second: LinkedNode? = node
        while first != nil && second != nil  {
            first = first?.next
            second = second?.next?.next
            if let first = first, let second = second {
                if first.value == second.value {
                    return true
                }
            }
        }
        return false
    }
    // delete node from one node list
    public class func deleteNodeFrom(node: LinkedNode, deleteNode: LinkedNode) -> LinkedNode? {
        var head: LinkedNode? = node
        
        if head === deleteNode {
            head = head?.next
        } else {
            var previous: LinkedNode? = node
            var target: LinkedNode? = node.next
            while target != nil {
                if let target = target, target === deleteNode {
                    previous?.next = target.next
                } else {
                    previous = previous?.next
                    target = target?.next
                }
            }
        }
        
        return head
    }
    // reverse one node list
    public class func reverse(node: LinkedNode) -> LinkedNode {
        var previous: LinkedNode? = nil
        var current: LinkedNode? = node
        
        while current != nil {
            let next: LinkedNode? = current!.next
            current!.next = previous
            previous = current
            current = next
        }
        
        return previous!
    }
    //reverse print one node list
    public class func reversePrint(node: LinkedNode) {
        let currentNode: LinkedNode = node
        if let nextNode = currentNode.next {
            reversePrint(node: nextNode)
        }
        print(currentNode.value)
    }
}
