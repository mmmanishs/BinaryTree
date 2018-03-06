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
    var rootNode = Node(value: 10, completion: nil)
    let startRect = CGRect(x: 100, y: 50, width: 50, height: 100)
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollview.contentSize = CGSize(width: 1500, height: 1500)
        self.scrollview.contentOffset = CGPoint(x: 750, y: 50)
        rootNode.center = self.scrollview.contentOffset
        DispatchQueue.main.async {
            self.buildBinaryTree(withRootNode: self.rootNode, numberOfNodes: 20)
            let renderTree = RenderTree(scrollView: self.scrollview)
            renderTree.drawTree(node: self.rootNode)
        }
        
    }
    
    func buildBinaryTree(withRootNode rootNode:Node<Int>, numberOfNodes: Int) {
        for _ in 1...numberOfNodes {
            var newNode = getNode()
            Node.attachNode(rootNode: rootNode, newNode: &newNode)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension ViewController {
    func getNode() -> Node<Int> {
        let num = Int(arc4random_uniform(100))
        let node = Node(value: num, completion: nil)
        return node
    }
}

