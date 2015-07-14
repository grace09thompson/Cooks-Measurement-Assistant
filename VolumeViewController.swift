//
//  VolumeViewController.swift
//  Cooks Measurement Assistant
//
//  Created by Grace Thompson on 6/9/15.
//  Copyright (c) 2015 Grace Thompson. All rights reserved.
//

import UIKit
import QuartzCore


class VolumeViewController: UIViewController, UITextFieldDelegate {
    
    var number: String! //user input number
    var measurementType: String! //store type of button pressed
    
    var buttonsArray: [UIButton] = [] //create empty array to adjust format settings of all buttons simultaneously.
    
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var tspButton: UIButton!
    @IBOutlet weak var tbspButton: UIButton!
    @IBOutlet weak var flozButton: UIButton!
    @IBOutlet weak var cupButton: UIButton!
    @IBOutlet weak var pintButton: UIButton!
    @IBOutlet weak var quartButton: UIButton!
    @IBOutlet weak var gallonButton: UIButton!
    @IBOutlet weak var milliliterButton: UIButton!
    @IBOutlet weak var literButton: UIButton!
    @IBOutlet weak var deciliterButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //label each button for transfer to next view
        //tspButton.titleLabel?.text = "tsp"
        //tbspButton.titleLabel?.text = "tbsp"
        //flozButton.titleLabel?.text = "fl. oz"
        //cupButton.titleLabel?.text = "cup"
        //pintButton.titleLabel?.text = "pint"
        //quartButton.titleLabel?.text = "quart"
        //gallonButton.titleLabel?.text = "gallon"
        //milliliterButton.titleLabel?.text = "milliliter"
        //literButton.titleLabel?.text = "liter"
        //deciliterButton.titleLabel?.text = "deciliter"
        
        //fill buttonsArray with buttons
        buttonsArray += [tspButton, tbspButton, flozButton, cupButton, pintButton, quartButton, gallonButton, milliliterButton, literButton, deciliterButton]
        
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
        ConversionCharts.volumeAmount = numberField.text
        number = ConversionCharts.volumeAmount
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
        let equivalenciesViewController = segue.destinationViewController as VolumeResultsViewController
    }
    
    func getButtonTitle(sender: UIButton) { //obtains title label to send along measurement type to next controller
        var currentTitle: String? {
            get {
                return sender.titleLabel?.text
            }
        }
        measurementType = currentTitle
        ConversionCharts.volumeMeasurementType = measurementType //update volume  measurement type in global variable file
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
            performSegueWithIdentifier("showVolumeEquivalencies", sender: sender)
        }
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
