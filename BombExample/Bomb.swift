//
//  Bomb.swift
//  BombExample
//
//  Created by ivan lares on 3/9/16.
//  Copyright © 2016 ivan lares. All rights reserved.
//

import Foundation
import SpriteKit

class Bomb: SKSpriteNode{
    
    init() {
        let bomb = SKTexture(imageNamed: "bomb")
        
        super.init(texture: bomb, color: UIColor.clearColor(), size: bomb.size())
        
        name = "bomb"
        physicsBody = SKPhysicsBody(rectangleOfSize: bomb.size())

        let bombFuse = SKSpriteNode(imageNamed: "bombFuse")
        bombFuse.anchorPoint = CGPoint(x: 0, y: 0)
        bombFuse.position = CGPoint(x: 0, y: (size.height/2) - 1)
        bombFuse.zPosition = self.zPosition - 1
        let fuseSpark = createFuseSpark(CGPoint(x: bombFuse.size.width, y: bombFuse.size.height))
        bombFuse.addChild(fuseSpark)
        
        addChild(bombFuse)
    }
    
    convenience init (position: CGPoint) {
        self.init()
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helpers
    
    private func createFuseSpark(position:CGPoint) -> SKEmitterNode {
        let fuseSpark = SKEmitterNode(fileNamed: "FuseSpark")
        fuseSpark?.position = position
        fuseSpark?.zPosition = self.zPosition
        return fuseSpark!
    }
    
}