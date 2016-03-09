//
//  GameViewController.swift
//  BombExample
//
//  Created by ivan lares on 3/9/16.
//  Copyright (c) 2016 ivan lares. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: CGSize(width:1536, height:2048))
        scene.physicsWorld.speed = 0.8
        scene.backgroundColor = UIColor.grayColor()
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}