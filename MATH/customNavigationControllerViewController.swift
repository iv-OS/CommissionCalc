//
//  customNavigationControllerViewController.swift
//  MATH
//
//  Created by Ivo Radoslavov on 12/7/15.
//  Copyright © 2015 Ivo Radoslavov. All rights reserved.
//

import UIKit

class customNavigationControllerViewController: UINavigationController {
    
    override func shouldAutorotate() -> Bool {
        
       if !viewControllers.isEmpty {
            
            // Check if this ViewController is the one you want to disable roration on
            if topViewController!.isKindOfClass(ViewController) ||
                topViewController!.isKindOfClass(OrderViewController) ||
                topViewController!.isKindOfClass(QuotesViewController){
                
                // If true return false to disable it
                return false
            }
        }
        
        // Else normal rotation enabled
        return true
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
