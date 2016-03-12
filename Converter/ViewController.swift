//
//  ViewController.swift
//  Converter
//
//  Created by IraM on 1/24/16.
//  Copyright © 2016 IraM. All rights reserved.
//

import SocketIOClientSwift
import CocoaAsyncSocket
import UIKit
import Foundation

enum BookType {
    case URL
    case FILE
    case UNDEFINED
}

class ViewController: UIViewController, GCDAsyncSocketDelegate{

    //MARK: property
    @IBOutlet weak var loadMediaBook: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    
    var booksManager:Client = Client()
    var bookType = BookType.URL
    
    //MARK: action
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


    @IBAction func onLoadBook(sender: AnyObject) {
        //Open file menager and choose book
        //pick book url to urlTextField
        self.urlTextField.resignFirstResponder()
        print("Choosen book mybook.pdf (url -> https://vk.com/doc139277848_366386809?hash).")
        urlTextField.text = "mybook.pdf"
        bookType = BookType.FILE
    }

    @IBAction func onConvert(sender: AnyObject) {
        self.urlTextField.resignFirstResponder()
        if urlTextField.text?.isEmpty == false {
            booksManager.sendBookUrl(bookType, urlString: urlTextField.text!)
            bookType = BookType.URL
        } else {
            print("urlTextField is empty!")
        }
        
    }
    
}