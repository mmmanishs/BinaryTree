
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
        traverseNode(node: rootNode, atLevel: 1)
        return numberOfNodes
    }
    
    func traverseNode(node: Node<Int>?, atLevel: Int) {
        guard let node = node else {
            levelCounter = levelCounter - 1
            return
        }
        if atLevel == (level - 1) {
            numberOfNodes = numberOfNodes + getNumberOfChildren(forNode: node)
            levelCounter = levelCounter - 1
            return
        }
        levelCounter = levelCounter + 1
        traverseNode(node: node.leftNode, atLevel: levelCounter)
        
        levelCounter = levelCounter + 1
        traverseNode(node: node.rightNode, atLevel: levelCounter)
        levelCounter = levelCounter - 1
    }
    
    func getNumberOfChildren(forNode node: Node<Int>) -> Int {
        var children = 0
        if let _ = node.leftNode {
            children = children + 1
        }
        if let _ = node.rightNode {
            children = children + 1
        }
        return children
    }
}

