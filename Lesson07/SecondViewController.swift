//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // TODO two: Make this text view print the values of the string and slider value stored in the settings bundle of the app.
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = NSUserDefaults.standardUserDefaults()
        
        let stringValue = defaults.objectForKey("settings_name") as! String
        let sliderValue = defaults.objectForKey("settings_slider") as! Float
      
        
        
        textView.text = "String value: " + stringValue + "  Slider value: " + "\(sliderValue)"
        // Do any additional setup after loading the view.
    }
}
