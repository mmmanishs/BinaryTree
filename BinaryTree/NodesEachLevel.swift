
//
//  NodesEachLevel.swift
//  BinaryTree
//
//  Created by Manish Singh on 3/5/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

class NodesEachLevel {
    
    var levelCounter = 1
    let level: Int
    let rootNode: Node<Int>
    var numberOfNodes = 0
    
    init(rootNode: Node<Int>, findNodesAtLevel level: Int) {
        self.level = level
        self.rootNode = rootNode
    }
    
    func find() -> Int {
        return getNumberOfNodes(rootNode: self.rootNode, atLevel: level)
    }
    
    func getNumberOfNodes(rootNode: Node<Int>, atLevel level: Int) -> Int {
        var queue = [rootNode]
        for _ in 1..<level {
            let queueCount = queue.count
            for _ in 0..<queueCount {
                let node = queue.removeLast()
                if let nodeLeft = node.leftNode {
                    queue.insert(nodeLeft, at: 0)
                }
                if let nodeRight = node.rightNode {
                    queue.insert(nodeRight, at: 0)
                }
            }
        }
        return queue.count
    }
    
}

