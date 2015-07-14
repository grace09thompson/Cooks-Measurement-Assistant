//
//  LengthViewController.swift
//  Cooks Measurement Assistant
//
//  Created by Grace Thompson on 6/16/15.
//  Copyright (c) 2015 Grace Thompson. All rights reserved.
//

import UIKit
import QuartzCore


class LengthViewController: UIViewController, UITextFieldDelegate {
    
    var number: String! //user input number
    var measurementType: String! //store type of button pressed
    
    var buttonsArray: [UIButton] = []
    
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var mmButton: UIButton!
    @IBOutlet weak var cmButton: UIButton!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var inButton: UIButton!
    @IBOutlet weak var ftButton: UIButton!
    @IBOutlet weak var ydButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonsArray += [mmButton, cmButton, mButton, inButton, ftButton, ydButton]
        
        for index in 0..<buttonsArray.count {
            let button = buttonsArray[index]
            button.layer.cornerRadius = 5
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldDoneEditing(sender:UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        ConversionCharts.lengthAmount = numberField.text
        number = ConversionCharts.lengthAmount
        numberField.resignFirstResponder()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if number == nil {
            return false
        } else {
            return true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let equivalenciesViewController = segue.destinationViewController as LengthResultsViewController
    }
    
    func getButtonTitle(sender: UIButton) { //obtains title label to send along measurement type to next controller
        var currentTitle: String? {
            get {
                return sender.titleLabel?.text
            }
        }
        measurementType = currentTitle
        ConversionCharts.lengthMeasurementType = measurementType //update volume  measurement type in global variable file
    }
    
    @IBAction func showEquivalencies(sender: UIButton) { //gets information for next view and transitions with segue.
        //set up alert for input validation
        if number == nil {
            let error = UIAlertController(title: "Error:", message: "Please specify a number", preferredStyle: .Alert)
            let response = UIAlertAction(title: "OK", style: .Default, handler: nil)
            error.addAction(response)
            presentViewController(error, animated: true, completion: nil)
        } else {
            getButtonTitle(sender)
            performSegueWithIdentifier("showLengthEquivalencies", sender: sender)
        }
    }
    
}
