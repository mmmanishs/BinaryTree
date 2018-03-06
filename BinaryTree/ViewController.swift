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
    let randomNumberUpperLimit = 20
    var rootNode = Node(value: 10, completion: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollview.contentSize = CGSize(width: 5500, height: 5000)
        self.scrollview.contentOffset = CGPoint(x: 2800, y: 150)
        rootNode.center = self.scrollview.contentOffset
        DispatchQueue.main.async {
            self.buildBinaryTree(withRootNode: self.rootNode, numberOfNodes: 20)
            let renderTree = RenderTree(scrollView: self.scrollview)
            renderTree.drawTree(node: self.rootNode)
        }
        
        DispatchQueue.main.async {
            print("Number of nodes = \(NodesEachLevel(rootNode: self.rootNode, findNodesAtLevel: 6).find())")
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
        let num = Int(arc4random_uniform(UInt32(randomNumberUpperLimit)))
        let node = Node(value: num, completion: nil)
        return node
    }
}

