//
//  File.swift
//  Pods-AA
//
//  Created by LonchIT on 2019/12/31.
//

import Foundation

open class LinkedNode {
    var value: Int
    var next: LinkedNode?
    
    public init(value: Int, next: LinkedNode?) {
        self.value = value
        self.next = next
    }
}

open class LinkedNodeGenerator {
    public func merge(node1: LinkedNode, node2: LinkedNode) -> LinkedNode {
        let isHead = node1.value <= node2.value
        var head = isHead ? node1 : node2
        var tempNode = head
        var tail = isHead ? node2 : node1
        var midNode = isHead ? node1.next : node2.next
        while tempNode != nil  && tail != nil {
            if midNode == nil {
                tempNode.next = tail
                break
            } else if midNode.value <= tail.value {
                tempNode.next = midNode
                tempNode = midNode
                midNode = midNode.next
            } else {
                tempNode.next = tail
                tempNode = tail
                tail = tail.next
            }
        }
        return head
    }
}
