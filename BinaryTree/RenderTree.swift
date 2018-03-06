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
    let width:CGFloat = 40.0
    let height:CGFloat = 40.0
    let scrollView: UIScrollView
    var drawCounter = 0.0
    
    init(scrollView: UIScrollView) {
        self.scrollView = scrollView
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

        DispatchQueue.main.asyncAfter(deadline: .now() + self.drawCounter) {
            if let parentCenter = node.parentCenter {
                self.scrollView.drawLine(fromPoint: parentCenter, toPoint: center, lineColor: UIColor.red)
            }
            let label = UILabel()
            label.frame.size = CGSize(width: self.width, height: self.height)
            label.center = center
            label.textAlignment = .center
            label.text = node.description()
            self.scrollView.addSubview(label)
        }
        self.drawCounter = self.drawCounter + 0.3
    }
}
