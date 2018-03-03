//
//  BinaryTree+AttachNode.swift
//  BinaryTree
//
//  Created by Manish Singh on 3/3/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

extension BinaryTree {
    static func attachNode(rootNode: inout BinaryTree, newNode: BinaryTree) {
        while true {
            if (try! newNode.getValue()) > (try! rootNode.getValue()) {
                if rootNode.isChildEmpty(child: .right) {
                    rootNode = BinaryTree.node(rootNode.getChildNode(child: .left), try! rootNode.getValue(), newNode)
                } else {
                    BinaryTree.attachNode(rootNode: &rootNode.getChildNode(child: .right), newNode: newNode)
                }
            } else {
                rootNode = BinaryTree.node(newNode, try! rootNode.getValue(), rootNode.getChildNode(child: .right))
            }
        }
    }
}
