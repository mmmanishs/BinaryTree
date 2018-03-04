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
}
