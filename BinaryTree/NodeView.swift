//
//  NodeView.swift
//  BinaryTree
//
//  Created by Manish Singh on 3/4/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
import  UIKit

class NodeView: UIView {
    var level: Int = 0
    var text: String?
    let label = UILabel()

    
    init(frame: CGRect, completion:@escaping (NodeView) -> ()) {
        super.init(frame: frame)
        DispatchQueue.main.async {
            completion(self)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
