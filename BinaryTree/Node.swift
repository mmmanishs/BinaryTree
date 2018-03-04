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
    var center: CGPoint?
    var atDepth: Int = 0
    init(value:T, completion: ((Node)->())?) {
        self.value = value
        completion?(self)
    }
}

extension Node where T == Int {
    func description() -> String {
        return String(self.value)
    }
}

extension Node {
    func getCenter(child: Child) -> CGPoint {
        guard let parentPoint = self.center else {
            return CGPoint(x: 0, y: 0)
        }
        var newX:CGFloat = 0.0
        var newY:CGFloat = 0.0
        
        switch child {
        case .left:
            if self.atDepth > 0 {
                newX = parentPoint.x - CGFloat(128 / self.atDepth)
                newY = parentPoint.y + 40
            }
            
            
        case .right:
            if self.atDepth > 0 {
                newX = parentPoint.x + CGFloat(128 / self.atDepth)
                newY = parentPoint.y + 40
            }
        }
        let point = CGPoint(x: newX, y: newY)
        return point
    }
}

