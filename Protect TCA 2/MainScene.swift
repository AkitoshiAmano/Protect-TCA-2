//
//  MainScene.swift
//  Protect TCA 2
//
//  Created by 朝倉明俊 on H28/02/16.
//  Copyright © 平成28年 朝倉明俊. All rights reserved.
//

import UIKit
import SpriteKit

class MainScene: SKScene {
    var centrePoint:CGPoint {
        return CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        userInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        
    }
}
