//
//  FileManagerViewController.swift
//  Converter
//
//  Created by IraM on 3/12/16.
//  Copyright © 2016 IraM. All rights reserved.
//

import Foundation
import UIKit

class FileManagerViewController : UITableViewController {
    
    // MARK: Navigation
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBAction func onDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate 
    
}
