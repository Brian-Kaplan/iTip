//
//  ViewController.swift
//  iTip
//
//  Created by Brian Kaplan on 12/2/15.
//  Copyright © 2015 Brian Kaplan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalDivTwoLabel: UILabel!
    @IBOutlet weak var totalDivThreeLabel: UILabel!
    @IBOutlet weak var totalDivFourLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var hiddenView: UIView!
    
    var tipShown = false
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipIndex = defaults.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex = defaultTipIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        totalDivTwoLabel.text = "$0.00"
        totalDivThreeLabel.text = "$0.00"
        totalDivFourLabel.text = "$0.00"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipIndex = defaults.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex = defaultTipIndex
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        if(billAmount == 0 || !tipShown) {
            UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
        
                var hiddenViewFrame = self.hiddenView.frame
                if(billAmount == 0) {
                    hiddenViewFrame.origin.y -= hiddenViewFrame.size.height
                    self.tipShown = false
                }
                else {
                    hiddenViewFrame.origin.y += hiddenViewFrame.size.height
                    self.tipShown = true
                }
                self.hiddenView.frame = hiddenViewFrame
        
                }, completion: { finished in
            })
        }
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        let totalDivTwo = total/2
        let totalDivThree = total/3
        let totalDivFour = total/4
        let tipString = String.localizedStringWithFormat("%.2f", tip)
        let totalString = String.localizedStringWithFormat("%.2f", total)
        let totalDivTwoString = String.localizedStringWithFormat("%.2f", totalDivTwo)
        let totalDivThreeString = String.localizedStringWithFormat("%.2f", totalDivThree)
        let totalDivFourString = String.localizedStringWithFormat("%.2f", totalDivFour)
        
        tipLabel.text = "$\(tipString)"
        totalLabel.text = "$\(totalString)"
        totalDivTwoLabel.text = "$\(totalDivTwoString)"
        totalDivThreeLabel.text = "$\(totalDivThreeString)"
        totalDivFourLabel.text = "$\(totalDivFourString)"

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

