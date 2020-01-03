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
    func merge(node1: LinkedNode, node2: LinkedNode) -> LinkedNode {
        return node1
    }
}
