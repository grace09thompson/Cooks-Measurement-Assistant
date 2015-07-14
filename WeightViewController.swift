//
//  WeightViewController.swift
//  Cooks Measurement Assistant
//
//  Created by Grace Thompson on 7/13/15.
//  Copyright (c) 2015 Grace Thompson. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController, UITextFieldDelegate {
    
    var number: String! //user input number
    var measurementType: String!
    
    var buttonsArray: [UIButton] = []
    
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var mgButton: UIButton!
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var kgButton: UIButton!
    @IBOutlet weak var ozButton: UIButton!
    @IBOutlet weak var lbButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonsArray += [mgButton, gButton, kgButton, ozButton, lbButton]
        for index in 0..<buttonsArray.count {
            let button = buttonsArray[index]
            button.layer.cornerRadius = 5
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        ConversionCharts.weightAmount = numberField.text
        number = ConversionCharts.weightAmount
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
        let equivalenciesViewController = segue.destinationViewController as WeightResultsViewController
    }
    
    func getButtonTitle(sender: UIButton) { //obtains title label to send along measurement type to next controller
        var currentTitle: String? {
            get {
                return sender.titleLabel?.text
            }
        }
        measurementType = currentTitle
        ConversionCharts.weightMeasurementType = measurementType //update volume  measurement type in global variable file
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
            performSegueWithIdentifier("showWeightEquivalencies", sender: sender)
        }
    }


    
}
