//
//  VolumeResultsViewController.swift
//  Cooks Measurement Assistant
//
//  Created by Grace Thompson on 6/9/15.
//  Copyright (c) 2015 Grace Thompson. All rights reserved.
//

import UIKit

class VolumeResultsViewController: UIViewController {
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var tspNum: UILabel!
    @IBOutlet weak var tbspNum: UILabel!
    @IBOutlet weak var flozNum: UILabel!
    @IBOutlet weak var cupNum: UILabel!
    @IBOutlet weak var pintNum: UILabel!
    @IBOutlet weak var quartNum: UILabel!
    @IBOutlet weak var gallonNum: UILabel!
    @IBOutlet weak var mlNum: UILabel!
    @IBOutlet weak var literNum: UILabel!
    @IBOutlet weak var dlNum: UILabel!
    
    var originalType: String!
    var stringAmount: String!
    var amount: Double!
    var results: [String] = [] //empty array that will hold the converted amounts
    var amountLabels: [UILabel] = [] //create empty array to hold all the labels
    
    func calculate(amount: Double, type: String) -> [String]! { //function to find the proper array from the volume measurements dictionary based on specified original type, multiplies each element by the user specified amount, and writes results to a new array.
        let typeArray: [Double] = ConversionCharts.volumeMeasurements[type]!
        
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

        amountLabels += [tspNum, tbspNum, flozNum, cupNum, pintNum, quartNum, gallonNum, mlNum, literNum, dlNum]
        
        for index in 0..<amountLabels.count {
            let label = amountLabels[index]
            label.layer.cornerRadius = 10
        }
        
        self.stringAmount = ConversionCharts.volumeAmount
        self.originalType = ConversionCharts.volumeMeasurementType
        amount = (stringAmount as NSString).doubleValue //convert String to Double
        
        if (amount > 1) || (amount < 1) {
            self.amountLabel.text = "\(stringAmount) \(originalType)S is equal to:"
        } else {
            self.amountLabel.text = "\(stringAmount) \(originalType) is equal to:"
        }
        
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
