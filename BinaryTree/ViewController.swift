//
//  ViewController.swift
//  BinaryTree
//
//  Created by Manish Singh on 2/27/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollview: UIScrollView!
    let renderTree = RenderTree()
    var rootNode = BinaryTree.node(.empty, 50, .empty)
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async {
            self.buildBinaryTree(withRootNode: &self.rootNode, numberOfNodes: 1000)
        }
    }
    
    func buildBinaryTree(withRootNode rootNode:inout BinaryTree<Int>, numberOfNodes: Int) {
        for _ in 1...numberOfNodes {
            let newNode = getNode()
            BinaryTree<Int>.attachNode(rootNode: &rootNode, newNode: newNode)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension ViewController {
    func getNode() -> BinaryTree<Int> {
        let num = Int(arc4random_uniform(100))
        let node = BinaryTree.node(.empty, num, .empty)
        return node
    }
}

