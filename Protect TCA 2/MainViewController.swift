//
//  MainViewController.swift
//  Protect TCA 2
//
//  Created by 朝倉明俊 on H28/02/16.
//  Copyright © 平成28年 朝倉明俊. All rights reserved.
//

import UIKit
import SpriteKit

class MainViewController: UIViewController {
    weak var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = .None
        
        var frame = view.bounds
        frame.size.height -= CGRectGetHeight(navigationController!.navigationBar.frame) + CGRectGetHeight(UIApplication.sharedApplication().statusBarFrame)
        let skView = SKView(frame: frame)
        view.addSubview(skView)
        self.skView = skView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
