//
//  SettingsViewController.swift
//  iTip
//
//  Created by Brian Kaplan on 12/9/15.
//  Copyright © 2015 Brian Kaplan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the saved tip setting
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipIndex = defaults.integerForKey("defaultTip")
        defaultTipSegment.selectedSegmentIndex = defaultTipIndex
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func settingChanged(sender: AnyObject){
        print(defaultTipSegment.selectedSegmentIndex)
        
        // Save the index for the default segment
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipSegment.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
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
