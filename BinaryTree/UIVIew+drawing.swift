//
//  NodeView.swift
//  BinaryTree
//
//  Created by Manish Singh on 3/4/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
import  UIKit

extension UIView {
    func drawLine(fromPoint: CGPoint, toPoint: CGPoint, lineColor: UIColor) {
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: fromPoint)
        path.addLine(to: toPoint)
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        self.layer.addSublayer(shapeLayer)
    }
}
