//
//  GameViewController.swift
//  Protect TCA 2
//
//  Created by 朝倉明俊 on H28/02/14.
//  Copyright (c) 平成28年 朝倉明俊. All rights reserved.
//

import UIKit
import SpriteKit

var lastScore:Int! = 0
var highScore:Int! = 0
var lastPlayedTime:Double! = 0
var bestPlayedTime:Double! = 0
var totalPlayedTime:Double! = 0
var defaults = NSUserDefaults.standardUserDefaults()

class GameViewController: UITableViewController {
    let cellReuseIdentifier = "cellReuseIdentifier"
    let titles:Array<String> = [
        "Start",
        "How to play",
        "Highest Score: ",
        "time best: ",
        "time total: ",
        "Settings"
    ]
    let controllers:Array<UIViewController> = [GameSceneViewController()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        title = "Protect TCA 2"

//        if let scene = GameScene(fileNamed:"GameScene") {
//            // Configure the view.
//            let skView = self.view as! SKView
//            skView.showsFPS = true
//            skView.showsNodeCount = true
//            
//            /* Sprite Kit applies additional optimizations to improve rendering performance */
//            skView.ignoresSiblingOrder = true
//            
//            /* Set the scale mode to scale to fit the window */
//            scene.scaleMode = .AspectFill
//            
//            skView.presentScene(scene)
//        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        
        // configure the cell
        let title = titles[indexPath.row]
        cell.textLabel?.text = title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let title = titles[indexPath.row]
        let controller = controllers[indexPath.row]
        controller.title = title
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
