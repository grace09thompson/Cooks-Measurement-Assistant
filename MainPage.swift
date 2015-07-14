//
//  MainPage.swift
//  Cooks Measurement Assistant
//
//  Created by Grace Thompson on 5/20/15.
//  Copyright (c) 2015 Grace Thompson. All rights reserved.
//

import UIKit

class MainPage: UIViewController {
    
    @IBOutlet weak var volumeButton: UIButton!
    @IBOutlet weak var weightButton: UIButton!
    @IBOutlet weak var lengthButton: UIButton!
    @IBOutlet weak var temperatureButton: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "temperature" {
            let typeOfUnit = segue.destinationViewController as TemperatureViewController
        }
        if segue.identifier == "volume" {
            let typeOfUnit = segue.destinationViewController as VolumeViewController
        }
        if segue.identifier == "length" {
            let typeOfUnit = segue.destinationViewController as LengthViewController
        }
        if segue.identifier == "weight" {
            let typeOfUnit = segue.destinationViewController as WeightViewController
        }
    }
    
    @IBAction func temperatureButtonPressed (sender: UIButton) {
        performSegueWithIdentifier("temperature", sender: sender)
    }
    
    @IBAction func volumeButtonPressed (sender: UIButton) {
        performSegueWithIdentifier("volume", sender: sender)
    }
    
    @IBAction func lengthButtonPressed (sender: UIButton) {
        performSegueWithIdentifier("length", sender: sender)
    }
    
    @IBAction func weightButtonPressed (sender: UIButton) {
        performSegueWithIdentifier("weight", sender: sender)
    }

}
