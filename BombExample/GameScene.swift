//
//  GameScene.swift
//  BombExample
//
//  Created by ivan lares on 3/9/16.
//  Copyright (c) 2016 ivan lares. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let worldNode = SKNode()
    
    // MARK: - LifeCycle
    
    override func didMoveToView(view: SKView) {
        addTouchEvents(view)
        addChild(worldNode)
        backgroundColor = UIColor.blackColor()
        addBackground()
    }
    
    override func update(currentTime: NSTimeInterval) {
        updateBombs()
    }
    
    // MARK: Helper 
    
    func addBackground(){
        let background = SKSpriteNode(imageNamed: "background")
        background.zPosition = Layer.Background.rawValue
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        worldNode.addChild(background)
    }
    
    func addBomb(xLocation: CGFloat){
        let bomb = Bomb()
        bomb.position = CGPoint(x: xLocation, y: size.height)
        bomb.zPosition = Layer.Bomb.rawValue
        worldNode.addChild(bomb)
    }
    
    func updateBombs() {
        worldNode.enumerateChildNodesWithName("bomb"){node, stop in
            if node.position.y < node.frame.size.height{
                self.removeAllBombs()
                self.screenFlash()
                self.screenShake()
            }
        }
    }
    
    func removeAllBombs(){
        worldNode.enumerateChildNodesWithName("bomb"){node, stop in
            node.removeFromParent()
        }
    }
    
    // MARK: Scene Effects
    
    func screenFlash() {
        let screenEffectNode = SKSpriteNode(color: UIColor.whiteColor(), size: size)
        screenEffectNode.alpha = 0
        screenEffectNode.zPosition = Layer.ScreenEffect.rawValue
        screenEffectNode.position = CGPoint(x: size.width/2, y: size.height/2)
        screenEffectNode.name = "effectNode"
        worldNode.addChild(screenEffectNode)
        
        let fadeIn = SKAction.fadeInWithDuration(0.6)
        let fadeOut = SKAction.fadeOutWithDuration(0.6)
        let removeEffectNode = SKAction.runBlock(){
            screenEffectNode.removeFromParent()
        }
        
        screenEffectNode.runAction(SKAction.sequence([fadeIn, fadeOut, removeEffectNode]))
        
    }
    
    func screenShake() {
        let originalPosition = worldNode.position
        
        let moveRight = SKAction.moveByX(120, y: -30, duration: 0.1)
        let moveToOrigin = SKAction.moveTo(originalPosition, duration: 0.1)
        let moveLeft = SKAction.moveByX(-120, y: 30, duration: 0.1)
        let shakeAction = SKAction.sequence([moveRight,moveToOrigin, moveLeft, moveToOrigin, moveRight, moveToOrigin])
        
        worldNode.runAction(shakeAction)
    }
    
    // MARK: - Gesture Recognizer
    
    func handleTapGesture(recognizer: UITapGestureRecognizer){
        let touchLocation =
        convertPointFromView(recognizer.locationInView(recognizer.view))
        addBomb(touchLocation.x)
    }
    
    func addTouchEvents(view: SKView){
        let tapGesture = UITapGestureRecognizer(target: self, action: "handleTapGesture:")
        view.addGestureRecognizer(tapGesture)
    }
    
}