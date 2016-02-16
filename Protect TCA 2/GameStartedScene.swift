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
    var invader:SKSpriteNode!
    var ball:SKSpriteNode!
    var background:SKSpriteNode!
    var light:SKLightNode!
    var startLabel = SKLabelNode()
    var timeLabel = SKLabelNode()
    var scoreLabel = SKLabelNode()
    var startTime:NSTimeInterval!
    var presentTime:NSTimeInterval!
    var playedTime:NSTimeInterval!
    var lastInvaderTime:NSTimeInterval!
    var gameStarted:Bool = false
    var invaderKilled:Int = 0
    var invaderOnScreen:Int = 0
    var displayTime:String!
    
    override func didMoveToView(view: SKView) {
        background = SKSpriteNode(color: SKColor.darkGrayColor(), size: self.frame.size)
        background.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        background.zPosition = 0.0
        background.alpha = 0.5
        self.addChild(background)
        
        TCALogo = SKSpriteNode(imageNamed: "Ball")
        TCALogo.xScale = 0.1
        TCALogo.yScale = 0.1
        TCALogo.zPosition = 1
        TCALogo.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
//        self.addChild(TCALogo)
        print(background.alpha)
        print(TCALogo.alpha)
        
        let circle = SKShapeNode(circleOfRadius: 1)
        circle.position = CGPointMake(self.size.width / 2.0, self.size.height / 2.0)
        circle.fillColor = UIColor.redColor()
        self.addChild(circle)
    }
}
