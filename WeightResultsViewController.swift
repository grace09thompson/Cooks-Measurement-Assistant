//
//  WeightResultsViewController.swift
//  Cooks Measurement Assistant
//
//  Created by Grace Thompson on 7/13/15.
//  Copyright (c) 2015 Grace Thompson. All rights reserved.
//

import UIKit

class WeightResultsViewController: UIViewController {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var mgNum: UILabel!
    @IBOutlet weak var gNum: UILabel!
    @IBOutlet weak var kgNum: UILabel!
    @IBOutlet weak var ozNum: UILabel!
    @IBOutlet weak var lbNum: UILabel!
    
    var originalType: String!
    var stringAmount: String!
    var amount: Double!
    var results: [String] = []
    var amountLabels: [UILabel] = []
    
    func calculate(amount: Double, type: String) -> [String]! { //function to find the proper array from the volume measurements dictionary based on specified original type, multiplies each element by the user specified amount, and writes results to a new array.
        let typeArray: [Double] = ConversionCharts.weightMeasurements[type]!
        
        for var index = 0; index < typeArray.count; index++ {
            let valueAtIndex = typeArray[index]
            let number = valueAtIndex * amount
            var stringNumber: String!
            
            if number % 1 == 0 {
                var intNumber = Int(number)
                stringNumber = String(intNumber)
                results += [stringNumber]
            } else {
                stringNumber = String(format: "%.2f", number)
                results += [stringNumber]
            }
        }
        return results
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountLabels += [mgNum, gNum, kgNum, ozNum, lbNum]
        
        for index in 0..<amountLabels.count {
            let label = amountLabels[index]
            label.layer.cornerRadius = 10
        }
        
        self.stringAmount = ConversionCharts.weightAmount
        self.originalType = ConversionCharts.weightMeasurementType
        amount = (stringAmount as NSString).doubleValue //convert String to Double
        
        self.amountLabel.text = "\(stringAmount) \(originalType) is equal to:"
        
        //if (amount > 1) || (amount < 1) {
        //    self.amountLabel.text = "\(stringAmount) \(originalType)S is equal to:"
        //} else {
        //    self.amountLabel.text = "\(stringAmount) \(originalType) is equal to:"
        //}
        
        let calculations = calculate(amount, type: originalType)
        
        for (var i = 0; i < amountLabels.count; i++) {
            amountLabels[i].text = calculations[i]
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}
