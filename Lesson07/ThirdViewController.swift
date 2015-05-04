//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    // TODO three: Save the text in this text box to a flat file when 'next' is pressed.
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let path = (NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as! NSURL).path!.stringByAppendingPathComponent("3rdVC/text.txt")
        
        if !NSFileManager.defaultManager().fileExistsAtPath(path) {
            var err: NSError?
            NSFileManager.defaultManager().createDirectoryAtPath(path.stringByDeletingLastPathComponent, withIntermediateDirectories: true, attributes: nil, error: &err)
            if err != nil {
                println("There was an error in creating the directory. \(err)")
            }
        }

        let textToSave = textView.text
        var err: NSError?
        textToSave.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: &err)
        if err != nil {
            println("There was an error saving. \(err)")
        }
    }
    
}
