//
//  RenderTree.swift
//  BinaryTree
//
//  Created by Manish Singh on 2/27/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
import UIKit

class RenderTree{
    
    let dFactor = 40
    let hFactor = 30
    let width:CGFloat = 40.0
    let height:CGFloat = 40.0
    let scrollView: UIScrollView
    
    init(scrollView: UIScrollView) {
        self.scrollView = scrollView
        
//        let point = drawLabel(nodeLabel: NodeLabel.left(scrollView.contentOffset, "10"))
//        let point1 = drawLabel(nodeLabel: NodeLabel.left(point, "23"))
//        let point2 = drawLabel(nodeLabel: NodeLabel.right(point, "45"))
//        let point3 = drawLabel(nodeLabel: NodeLabel.left(point2, "202"))
//        let point5 = drawLabel(nodeLabel: NodeLabel.right(point2, "92"))

    }
    
    func drawTree(node: Node<Int>?) {
        guard let node = node else {
            return
        }
        do {
            try process(node: node)
        } catch {
            print("Exception occured while processing node")
            return
        }
        if let leftNode = node.leftNode {
            drawTree(node: leftNode)
        }
        if let rightNode = node.rightNode {
            drawTree(node: rightNode)
        }
    }
    
    func process(node: Node<Int>) throws {
        guard let center = node.center else {
            throw TreeError.centerCannotBeNil
        }

        let label = UILabel()
        label.frame.size = CGSize(width: width, height: height)
        label.center = center
        label.textAlignment = .center
        label.text = node.description()
        scrollView.addSubview(label)
    }
    
//    private func drawLabel(nodeLabel: NodeLabel) -> CGPoint {
//        let label = nodeLabel.getLabel()
//        self.scrollView.addSubview(label)
//        return label.center
//    }
    
}

enum NodeLabel {
    case left
    case right
//    func getLabel() -> UILabel{
//        let label = UILabel()
//        var newX:CGFloat = 0.0
//        var newY:CGFloat = 0.0
//        let width:CGFloat = 40
//        let height:CGFloat = 40
//        switch self {
//        case .left(let parentPoint, let text):
//            newX = parentPoint.x - 60
//            newY = parentPoint.y + 20
//            label.text = text
//        case .right(let parentPoint, let text):
//            newX = parentPoint.x + 20
//            newY = parentPoint.y + 20
//            label.text = text
//        }
//        label.frame = CGRect(x: newX, y: newY, width: width, height: height)
//        label.textAlignment = .center
//        label.backgroundColor = UIColor.lightGray
//        return label
//    }

}
