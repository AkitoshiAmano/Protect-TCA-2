//
//  GameSceneViewController.swift
//  Protect TCA 2
//
//  Created by 朝倉明俊 on H28/02/16.
//  Copyright © 平成28年 朝倉明俊. All rights reserved.
//

import UIKit
import SpriteKit

// height of navigation bar
var navBarHeight:CGFloat!

class GameSceneViewController: MainViewController {
    var scene:GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // hide navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // get height of navigation bar
        navBarHeight = self.navigationController?.navigationBar.frame.size.height
        // set game scene
        scene = GameScene(size: skView.frame.size)
        // move to game scene
        skView.presentScene(scene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // hide status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
