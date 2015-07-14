//
//  LengthResultsViewController.swift
//  Cooks Measurement Assistant
//
//  Created by Grace Thompson on 6/16/15.
//  Copyright (c) 2015 Grace Thompson. All rights reserved.
//

import UIKit

class LengthResultsViewController: UIViewController {
    
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var mmNumLabel: UILabel!
    @IBOutlet weak var cmNumLabel: UILabel!
    @IBOutlet weak var mNumLabel: UILabel!
    @IBOutlet weak var inNumLabel: UILabel!
    @IBOutlet weak var ftNumLabel: UILabel!
    @IBOutlet weak var ydNumLabel: UILabel!
    
    var originalType: String!
    var stringAmount: String!
    var amount: Double!
    var results: [String] = []
    var amountLabels: [UILabel] = []
    
    func calculate(amount: Double, type: String) -> [String]! { //function to find the proper array from the volume measurements dictionary based on specified original type, multiplies each element by the user specified amount, and writes results to a new array.
        let typeArray: [Double] = ConversionCharts.lengthMeasurements[type]!
        
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

        // Do any additional setup after loading the view.
        amountLabels += [mmNumLabel, cmNumLabel, mNumLabel, inNumLabel, ftNumLabel, ydNumLabel]
        
        for index in 0..<amountLabels.count {
            let label = amountLabels[index]
            label.layer.cornerRadius = 10
        }
        
        self.stringAmount = ConversionCharts.lengthAmount
        self.originalType = ConversionCharts.lengthMeasurementType
        self.amount = (stringAmount as NSString).doubleValue
        
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
