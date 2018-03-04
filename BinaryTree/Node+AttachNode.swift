//
//  BinaryTree+AttachNode.swift
//  BinaryTree
//
//  Created by Manish Singh on 3/3/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

extension Node {
    static func attachNode(rootNode: Node, newNode: inout Node) {
        newNode.atDepth = newNode.atDepth + 1
        if newNode.value > rootNode.value {
            if let rightNode = rootNode.rightNode {
                Node.attachNode(rootNode: rightNode, newNode: &newNode)
            } else {
                rootNode.rightNode = newNode
                newNode.center = newNode.getCenter(child: .right)
            }
        } else {
            if let leftNode = rootNode.leftNode {
                Node.attachNode(rootNode: leftNode, newNode: &newNode)
            } else {
                rootNode.leftNode = newNode
                newNode.center = newNode.getCenter(child: .left)
            }
        }
    }
}
