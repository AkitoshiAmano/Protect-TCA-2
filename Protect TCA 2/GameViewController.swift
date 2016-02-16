//
//  GameViewController.swift
//  Protect TCA 2
//
//  Created by 朝倉明俊 on H28/02/14.
//  Copyright (c) 平成28年 朝倉明俊. All rights reserved.
//

import UIKit

class GameViewController: UITableViewController {
    var lastScore:Int! = 0
    var highScore:Int! = 0
    var lastPlayedTime:Double! = 0
    var bestPlayedTime:Double! = 0
    var totalPlayedTime:Double! = 0
    // use to save and get recent data
    var defaults = NSUserDefaults.standardUserDefaults()
    
    // identifier
    let cellReuseIdentifier = "cellReuseIdentifier"
    // titles for table view cell
    let titles = [
            "Start",
            "How to play",
            "Record",
            "Settings"
    ]
    // view move to for every table view cell
    let controllers: [UIViewController] = [
        GameSceneViewController()
    ]
    
    // after view loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get score data
        lastScore = defaults.integerForKey("LastScore")
        highScore = defaults.integerForKey("HighScore")
        if lastScore > highScore {
            highScore = lastScore
        }
        // set new high score
        defaults.setObject(highScore, forKey: "HighScore")
        
        // get time data
        lastPlayedTime = defaults.doubleForKey("LastTime")
        bestPlayedTime = defaults.doubleForKey("BestTime")
        totalPlayedTime = defaults.doubleForKey("TotalTime") + lastPlayedTime
        // set new total played time
        defaults.setDouble(totalPlayedTime, forKey: "TotalTime")
        
        // set table view
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        // set view title
        title = "Protect TCA 2"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        
        // Configure the cell...
        let title = titles[indexPath.row]
        cell.textLabel?.text = title
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let title = titles[indexPath.row]
        let controller = controllers[indexPath.row]
        controller.title = title
        self.navigationController?.pushViewController(controller, animated: true)
    }
}