//
//  GameScene.swift
//  Protect TCA 2
//
//  Created by 朝倉明俊 on H28/02/14.
//  Copyright (c) 平成28年 朝倉明俊. All rights reserved.
//

import SpriteKit

var defaults = NSUserDefaults.standardUserDefaults()

class GameScene: SKScene {
    var highScoreLabel:SKLabelNode!
    var bestPlayedTimeLabel:SKLabelNode!
    var totalPlayedTimeLabel:SKLabelNode!
    var settingButton:SKLabelNode!
    var startButton:SKLabelNode!
    var instructionButton:SKLabelNode!
    var background:SKSpriteNode!
    var startLogo:SKSpriteNode!
    var startLogoMovement:SKAction!
    var lastScore:Int!
    var highScore:Int!
    var lastPlayedTime:Double!
    var bestPlayedTime:Double!
    var totalPlayedTime:Double!
    
    override func didMoveToView(view: SKView) {
        background = SKSpriteNode(color: SKColor.darkGrayColor(), size: self.frame.size)
        background.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        self.addChild(background)
        
        // get score data
        lastScore = defaults.integerForKey("LastScore")
        highScore = defaults.integerForKey("HighScore")
        if lastScore > highScore {
            highScore = lastScore
        }
        defaults.setObject(highScore, forKey: "HighScore")
        
        // get time data
        lastPlayedTime = defaults.doubleForKey("LastTime")
        bestPlayedTime = defaults.doubleForKey("BestTime")
        totalPlayedTime = defaults.doubleForKey("TotalTime") + lastPlayedTime
        defaults.setDouble(totalPlayedTime, forKey: "TotalTime")
        
        // set label
        startButton = SKLabelNode(text: "Start", fontSize: 30, fontColor: UIColor.redColor(), position: CGPoint(x: size.width * 0.5, y: size.height * 0.5))
        self.addChild(startButton)
        
        instructionButton = SKLabelNode(text: "How to play", fontSize: 30, fontColor: UIColor.greenColor(), position: CGPoint(x: size.width * 0.5, y: size.height * 0.5 - 30))
        self.addChild(instructionButton)
        
        highScoreLabel = SKLabelNode(text: "Highest Score: \(highScore)", fontSize: 30, fontColor: UIColor.redColor(), position: CGPoint(x: size.width * 0.5, y: size.height * 0.5 - 60))
        self.addChild(highScoreLabel)
        
        bestPlayedTimeLabel = SKLabelNode(text: "time best: \(bestPlayedTime)", fontSize: 30, fontColor: UIColor.redColor(), position: CGPoint(x: size.width * 0.5, y: size.height * 0.5 - 90))
        self.addChild(bestPlayedTimeLabel)
        
        totalPlayedTimeLabel = SKLabelNode(text: "time total: \(totalPlayedTime)", fontSize: 30, fontColor: UIColor.redColor(), position: CGPoint(x: size.width * 0.5, y: size.height * 0.5 - 120))
        self.addChild(totalPlayedTimeLabel)
        
        settingButton = SKLabelNode(text: "Settings", fontSize: 30, fontColor: UIColor.redColor(), position: CGPoint(x: size.width * 0.5, y: size.height * 0.5 - 150))
        self.addChild(settingButton)
        
//        startLogo = SKSpriteNode(imageNamed: "Ball", xScale: 0.1, yScale: 0.1, position: CGPoint(x: size.width * 0.5, y: size.height * 0.5))
//        startLogo = SKSpriteNode(imageNamed: "Ball")
//        startLogo.xScale = 0.1
//        startLogo.yScale = 0.1
//        startLogo.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5 + 90)
//        self.addChild(startLogo)
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

            
            let touchLocation = touch.locationInNode(self)
            print(touchLocation)
//            var transition:SKTransition!
            if startButton.containsPoint(touchLocation) {
                let gameStartScene = GameStartedScene()
                gameStartScene.scaleMode = SKSceneScaleMode.AspectFill
                self.view?.presentScene(gameStartScene)
            }
        }
    }
}
