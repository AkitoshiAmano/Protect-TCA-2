//
//  GameScene.swift
//  Protect TCA 2
//
//  Created by 朝倉明俊 on H28/02/14.
//  Copyright (c) 平成28年 朝倉明俊. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: MainScene {
    var highScoreLabel:SKLabelNode!
    var bestPlayedTimeLabel:SKLabelNode!
    var totalPlayedTimeLabel:SKLabelNode!
    var settingButton:SKLabelNode!
    var startButton:SKLabelNode!
    var instructionButton:SKLabelNode!
    var background:SKSpriteNode!
    var startLogo:SKSpriteNode!
    var startLogoMovement:SKAction!
    
    override func didMoveToView(view: SKView) {
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            
        }
    }
}
