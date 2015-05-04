//
//  FifthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
// TODO Five: Strings can be entered into this text box in a space-delimited fashion. They represent an array of strings. E.g. the entry "a b c" corresponds to array ["a", "b", "c"]. Save the array of strings that corresponds to the text in this text box to a file.
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var strings = [String]()
        var newString = ""
        
        for char in textView.text {
            if char != " " {
                newString.append(char)
            }  else {
                if newString != "" {
                    strings.append(newString)
                    newString = ""
                }
            }
        }
        
        if newString != "" {
            strings.append(newString)
            newString = ""
        }
        
        let path = (NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as! NSURL).path!.stringByAppendingPathComponent("5thVC/spaced-array.plist") //(NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as! NSURL).path!.stringByAppendingPathComponent("5thVC/spaced-array.txt")
        
        
        if !NSFileManager.defaultManager().fileExistsAtPath(path) {
            var err: NSError?
            NSFileManager.defaultManager().createDirectoryAtPath(path.stringByDeletingLastPathComponent, withIntermediateDirectories: true, attributes: nil, error: &err)
            if err != nil {
                println("There was an error in creating the directory. \(err)")
            }
        }
        
        var err: NSError?;
        let data: NSData? = NSPropertyListSerialization.dataWithPropertyList(strings, format: NSPropertyListFormat.BinaryFormat_v1_0, options: 0, error: &err)
        
        if data != nil {
            data!.writeToFile(path, atomically: true)
        }
        
        //NSKeyedArchiver.archiveRootObject(strings, toFile: path)

    }
}
