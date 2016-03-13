//
//  FileManagerViewController.swift
//  Converter
//
//  Created by IraM on 3/12/16.
//  Copyright © 2016 IraM. All rights reserved.
//

import Foundation
import UIKit
import SwiftyDropbox

class FileManagerViewController : UITableViewController {
    
    // MARK: Navigation
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBAction func onDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    @IBAction func linkButtonPressed(sender: AnyObject) {
        if (Dropbox.authorizedClient == nil) {
            Dropbox.authorizeFromController(self)
        } else {
            print("User is already authorized!")
        }
    }
    
   /* override func viewDidLoad() {
        super.viewDidLoad()
        
        // Verify user is logged into Dropbox
        if let client = Dropbox.authorizedClient {
            
            // Get the current user's account info
            client.users.getCurrentAccount().response { response, error in
                print("*** Get current account ***")
                if let account = response {
                    print("Hello \(account.name.givenName)!")
                } else {
                    print(error!)
                }
            }
            
            // List folder
            client.files.listFolder(path: "").response { response, error in
                print("*** List folder ***")
                if let result = response {
                    print("Folder contents:")
                    for entry in result.entries {
                        print(entry.name)
                    }
                } else {
                    print(error!)
                }
            }
            
            // Upload a file
            let fileData = "Hello!".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
            client.files.upload(path: "/hello.txt", body: fileData!).response { response, error in
                if let metadata = response {
                    print("*** Upload file ****")
                    print("Uploaded file name: \(metadata.name)")
                    print("Uploaded file revision: \(metadata.rev)")
                    
                    // Get file (or folder) metadata
                    client.files.getMetadata(path: "/hello.txt").response { response, error in
                        print("*** Get file metadata ***")
                        if let metadata = response {
                            if let file = metadata as? Files.FileMetadata {
                                print("This is a file with path: \(file.pathLower)")
                                print("File size: \(file.size)")
                            } else if let folder = metadata as? Files.FolderMetadata {
                                print("This is a folder with path: \(folder.pathLower)")
                            }
                        } else {
                            print(error!)
                        }
                    }
                    
                    // Download a file
                    
                    let destination : (NSURL, NSHTTPURLResponse) -> NSURL = { temporaryURL, response in
                        let fileManager = NSFileManager.defaultManager()
                        let directoryURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
                        // generate a unique name for this file in case we've seen it before
                        let UUID = NSUUID().UUIDString
                        let pathComponent = "\(UUID)-\(response.suggestedFilename!)"
                        return directoryURL.URLByAppendingPathComponent(pathComponent)
                    }
                    client.files.download(path: "/hello.txt", destination: destination).response { response, error in
                        //client.files.download(path: "/hello.txt").response { response, error in
                        if let (metadata, url) = response {
                            print("*** Download file ***")
                            let data = NSData(contentsOfURL: url)
                            print("Downloaded file name: \(metadata.name)")
                            print("Downloaded file url: \(url)")
                            print("Downloaded file data: \(data)")
                        } else {
                            print(error!)
                        }
                    }
                    
                } else {
                    print(error!)
                }
            }
        }
    }*/
    
}
