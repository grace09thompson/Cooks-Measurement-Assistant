//
//  TemperatureResultsViewController.swift
//  Cooks Measurement Assistant
//
//  Created by Grace Thompson on 5/20/15.
//  Copyright (c) 2015 Grace Thompson. All rights reserved.
//

import UIKit

class TemperatureResultsViewController: UIViewController {
    
    @IBOutlet weak var originalNumberLabel: UILabel!
    @IBOutlet weak var originalTypeLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var temperatureTypeLabel: UILabel!
    
    
    
    var tempType: String!
    var otherTempType: String!
    var originalNumber: String!
    var inputNumber: Double!
    var resultNumber: Double!
    var resultAsDouble: Double!
    var resultAsString: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultAsDouble = temperatureCalculations(inputNumber, type: tempType)
        
        resultAsString = NSString(format: "%.1f", resultAsDouble)
        
        self.originalNumberLabel.text = "\(originalNumber)\u{00B0}"
        self.originalTypeLabel.text = "\(tempType) is equal to:"
        self.numberLabel.text = "\(resultAsString)\u{00B0}"
        self.temperatureTypeLabel.text = otherTempType
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func temperatureCalculations(number: Double, type: String) -> Double! {
        if type == "Fahrenheit" {
            resultNumber = (inputNumber - 32) * 5/9
        }
        else {
            resultNumber = inputNumber * 9/5 + 32
        }
        return resultNumber
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
