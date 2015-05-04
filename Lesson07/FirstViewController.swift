//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var tvString = ""
        
        if let ts: AnyObject? = defaults.objectForKey("test_string"){
            tvString += "test_string: \(ts!) "
        }
        
        if let tn: AnyObject? = defaults.objectForKey("test_number"){
            tvString += "test_number: \(tn!)"
        }
        
        textView.text = tvString
        
    }
}