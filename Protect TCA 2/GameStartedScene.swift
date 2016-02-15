//
//  GameStartedScene.swift
//  Protect TCA 2
//
//  Created by 朝倉明俊 on H28/02/14.
//  Copyright © 平成28年 朝倉明俊. All rights reserved.
//

import SpriteKit

let MASK_EDGE:UInt32 = 0b1
let MASK_BALL:UInt32 = 0b10
let MASK_LOGO:UInt32 = 0b100
let MASK_INVADER:UInt32 = 0b1000

class GameStartedScene: SKScene, SKPhysicsContactDelegate {
    var TCALogo:SKSpriteNode!
    var invader = SKSpriteNode(imageNamed: "Invader")
    var ball = SKSpriteNode(imageNamed: "Ball")
    var background:SKSpriteNode!
    // light, use to display object only near the logo
    var light = SKLightNode()
    
    var startLabel = SKLabelNode()
    var timeLabel = SKLabelNode()
    var scoreLabel = SKLabelNode()
    
    var startTime:NSTimeInterval!
    var presentTime:NSTimeInterval!
    var playedTime:NSTimeInterval!
    // when last invader has been created
    var lastInvaderTime:NSTimeInterval!
    
    var gameStarted:Bool = false
    
    var invaderKilled:Int = 0
    var invaderOnScreen:Int = 0
    
    // time displayed in time label (played time)
    var displayTime:String!
    
    override func didMoveToView(view: SKView) {
//        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
//        physicsBody?.contactTestBitMask = MASK_EDGE
//        physicsWorld.contactDelegate = self
        
        background = SKSpriteNode(color: SKColor.darkGrayColor(), size: self.frame.size, position: CGPoint(x: size.width * 0.5, y: size.height * 0.5))
        background.lightingBitMask = 1
        self.addChild(background)
        
        light.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
//        self.addChild(light)
        
        TCALogo = SKSpriteNode(imageNamed: "Ball", xScale: 0.1, yScale: 0.1, position: CGPoint(x: size.width * 0.5, y: size.height * 0.5))
        TCALogo.lightingBitMask = 1
        self.addChild(TCALogo)
        
        setAndAddLabelToScene(self, label: startLabel, text: "Touch to Start", fontColor: UIColor.redColor(), fontSize: 30, positionFromCentreX: 0, positionFromCentreY: 0)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Ball")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
}
