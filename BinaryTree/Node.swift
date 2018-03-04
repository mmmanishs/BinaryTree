//
//  BinaryNode.swift
//  BinaryTree
//
//  Created by Manish Singh on 2/27/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
import UIKit

enum Child {
    case right
    case left
}
enum TreeError: Error {
    case valueCannotBeNil
    case centerCannotBeNil
}

class Node<T> where T: Comparable {
    let value: T
    var rightNode: Node<T>?
    var leftNode: Node<T>?
    var atDepth: Int = 0
    var center: CGPoint?
    var parentCenter: CGPoint?
    let initalDrawLineLength = 256
    let drawLineDepth:CGFloat = 80.0
    
    init(value:T, completion: ((Node)->())?) {
        self.value = value
        completion?(self)
    }
    static func attachNode(rootNode: Node, newNode: inout Node) {
        newNode.atDepth = newNode.atDepth + 1
        if newNode.value > rootNode.value {
            if let rightNode = rootNode.rightNode {
                Node.attachNode(rootNode: rightNode, newNode: &newNode)
            } else {
                rootNode.rightNode = newNode
                newNode.center = newNode.getCenter(child: .right, parentPoint: rootNode.center)
                newNode.parentCenter = rootNode.center
            }
        } else {
            if let leftNode = rootNode.leftNode {
                Node.attachNode(rootNode: leftNode, newNode: &newNode)
            } else {
                rootNode.leftNode = newNode
                newNode.center = newNode.getCenter(child: .left, parentPoint: rootNode.center)
                newNode.parentCenter = rootNode.center
            }
        }
    }

}

extension Node {
    func getCenter(child: Child, parentPoint: CGPoint?) -> CGPoint {
        guard let parentPoint = parentPoint else {
            return CGPoint(x: 0, y: 0)
        }
        var newX:CGFloat = 0.0
        var newY:CGFloat = 0.0
        
        switch child {
        case .left:
            if self.atDepth > 0 {
                newX = parentPoint.x - CGFloat(initalDrawLineLength / self.atDepth)
                newY = parentPoint.y + drawLineDepth
            }
            
            
        case .right:
            if self.atDepth > 0 {
                newX = parentPoint.x + CGFloat(initalDrawLineLength / self.atDepth)
                newY = parentPoint.y + drawLineDepth
            }
        }
        let point = CGPoint(x: newX, y: newY)
        return point
    }
}

extension Node where T == Int {
    func description() -> String {
        return String(self.value)
    }
}



