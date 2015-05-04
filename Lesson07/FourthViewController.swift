//
//  FourthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    // TODO four: Read the file saved in the previous TODO, and make this text box print out the text of that file.
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let path = (NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as! NSURL).path!.stringByAppendingPathComponent("3rdVC/text.txt")
        
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            var err:NSError?
            textView.text = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: &err)
            
            if err != nil {
                println("there was an error\(err)")
            }
        }
    }
}
