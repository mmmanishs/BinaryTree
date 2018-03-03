//
//  BinaryNode.swift
//  BinaryTree
//
//  Created by Manish Singh on 2/27/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

enum Child {
    case right
    case left
}
enum TreeError: Error {
    case valueCannotBeNil
}
indirect enum BinaryTree<T> where T: Comparable {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
    
    func getValue() throws -> T {
        switch self {
        case .node(_, let value, _):
            return value
        default:
            throw(TreeError.valueCannotBeNil)
        }
    }
    
    func getChildNode(child: Child) -> BinaryTree {
        switch self {
        case .node(let left, _, let right):
            switch child {
            case .right:
                return right
            case .left:
                return left
            }
        default:
            return .empty
        }
    }
    
    func isChildEmpty(child: Child) -> Bool {
        switch self {
        case .node(let left, _, let right):
            switch child {
            case .right:
                switch right {
                case .empty: return true
                case .node(_, _, _):
                    return false
                }
            case .left:
                switch left {
                case .empty: return true
                case .node(_, _, _):
                    return false
                }
            }
        default:
            return true
        }
    }
}
