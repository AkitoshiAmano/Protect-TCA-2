//
//  GameScene.swift
//  Protect TCA 2
//
//  Created by 朝倉明俊 on H28/02/14.
//  Copyright (c) 平成28年 朝倉明俊. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: MainScene, SKPhysicsContactDelegate {
    // logo
    var logo:SKSpriteNode!
    // ball, use to attack enemy
    var ball:SKSpriteNode!
    // enemy
    var enemy:SKSpriteNode!
    // use to go back to main menu
    var backButton:SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        // set background
        let background = SKSpriteNode(color: SKColor.darkGrayColor(), size: CGSize(width: self.frame.width, height: self.frame.height), position: CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame)))
        // add background
        self.addChild(background)
        
        // set logo image
        logo = SKSpriteNode(imageNamed: "TCALogo")
        
        // set ball image
        ball = SKSpriteNode(imageNamed: "Ball")
        // set ball image size
        ball.xScale = 0.05
        ball.yScale = 0.05
        // set ball init location
        ball.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
        
        // set enemy image
        enemy = SKSpriteNode(imageNamed: "Enemy")
        
        // set logo position
        logo.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
        // add logo to scene
        self.addChild(logo)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            // get touched location
            let touchLocation = touch.locationInNode(self)
            
            // add ball to scene
            self.addChild(ball)
            
            // set move vector
            let moveVector = CGVector(dx: touchLocation.x, dy: touchLocation.y)
            // set ball action
            // move to vector
            let ballAction = SKAction.moveBy(moveVector, duration: 0.5)
            // ball run action
            ball.runAction(ballAction)
            
            // delete ball if out of scene
            if ball.position.x > CGRectGetMaxX(frame) || ball.position.x < CGRectGetMinX(frame) || ball.position.y > CGRectGetMaxY(frame) || ball.position.y < CGRectGetMinY(frame) {
                ball.removeFromParent()
            }
        }
    }
}
