
//
//  SixthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {
// TODO six: Read the array saved in the previous file and print its space-delimited string representation here.
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = (NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as! NSURL).path!.stringByAppendingPathComponent("5thVC/spaced-array.plist")//(NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as! NSURL).path!.stringByAppendingPathComponent("5thVC/spaced-array.txt")
        
        let data = NSData(contentsOfFile: path)
        
        var err: NSError?;
        let strings: [String]? = NSPropertyListSerialization.propertyListWithData(data!, options: 0, format: nil, error: &err) as? [String]//NSKeyedUnarchiver.unarchiveObjectWithFile(path) as! [String]
        
        var tvText = ""
        
        if strings != nil {
            for str in strings! {
                tvText += str + " "
            }
        }
        
        
        textView.text = tvText
        

        // Do any additional setup after loading the view.
    }
}
