//
//  TemperatureViewController.swift
//  Cooks Measurement Assistant
//
//  Created by Grace Thompson on 5/20/15.
//  Copyright (c) 2015 Grace Thompson. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController {
    
    @IBOutlet weak var fahrenheitButton: UIButton!
    @IBOutlet weak var celsiusButton: UIButton!
    @IBOutlet weak var degreeField: UITextField!
    
    var degreeNumberAsString: String!
    var degreeNumber: Double!
    var degreeType: String!
    var otherDegreeType: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        degreeNumberAsString = degreeField.text
        degreeNumber = (degreeNumberAsString as NSString).doubleValue
        degreeField.resignFirstResponder()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if degreeNumber == nil {
            return false
        } else {
            return true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "temperatureResults" {
            let temperatureResultsViewController = segue.destinationViewController as TemperatureResultsViewController
            temperatureResultsViewController.tempType = degreeType
            temperatureResultsViewController.otherTempType = otherDegreeType
            temperatureResultsViewController.originalNumber = degreeNumberAsString
            temperatureResultsViewController.inputNumber = degreeNumber 
        }
    }
    
    func errorMessage() {
        let error = UIAlertController(title: "Error:", message: "Please specify a number before continuing.", preferredStyle: .Alert)
        let response = UIAlertAction(title: "OK", style: .Default, handler: nil)
        error.addAction(response)
        presentViewController(error, animated: true, completion: nil)
    }
    
    @IBAction func fahrenheitButtonPressed(sender: UIButton) {
        degreeType = "Fahrenheit"
        otherDegreeType = "Celsius"
        if degreeNumber == nil {
            errorMessage()
        }else {
            performSegueWithIdentifier("temperatureResults", sender: sender)
        }
        
    }
    @IBAction func celsiusButtonPressed(sender: UIButton) {
        degreeType = "Celsius"
        otherDegreeType = "Fahrenheit"
        if degreeNumber == nil {
            errorMessage()
        } else {
            performSegueWithIdentifier("temperatureResults", sender: sender)
        }
    }
    

   

}
