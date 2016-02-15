//
//  Function.swift
//  Protect TCA 2
//
//  Created by 朝倉明俊 on H28/02/14.
//  Copyright © 平成28年 朝倉明俊. All rights reserved.
//

import Foundation
import SpriteKit

func setAndAddLabelToScene(gameScene:SKScene, var label:SKLabelNode, text:String?, fontColor:UIColor?, fontSize:CGFloat, positionFromCentreX:CGFloat, positionFromCentreY:CGFloat) {
    label = SKLabelNode(text: text)
    label.fontColor = fontColor
    label.fontSize = fontSize
    label.position = CGPoint(x: gameScene.frame.size.width * 0.5 - positionFromCentreX, y: gameScene.frame.size.height * 0.5 - positionFromCentreY)
    gameScene.addChild(label)
}

public extension SKLabelNode {
    convenience init(text: String?, fontSize: CGFloat, fontColor: UIColor?, position: CGPoint) {
        self.init()
        self.text = text
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.position = position
    }
}

public extension SKSpriteNode {
    convenience init(color: UIColor, size: CGSize, position: CGPoint) {
        self.init()
        self.color = color
        self.size = size
        self.position = position
    }
    convenience init(imageNamed: String, xScale: CGFloat, yScale: CGFloat, position: CGPoint) {
        self.init(imageNamed: imageNamed)
        self.xScale = xScale
        self.yScale = yScale
        self.position = position
    }
}