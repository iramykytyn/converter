//
//  Client.swift
//  Converter
//
//  Created by IraM on 2/24/16.
//  Copyright © 2016 IraM. All rights reserved.
//

import Foundation
import CocoaAsyncSocket

class Client : GCDAsyncSocket {
    var socket:GCDAsyncSocket!
    var downloadFromInternet = false
    var refToSelf:NSObject!
    
   /* init(refToSf: NSObject) {
        super.init()
        refToSelf = refToSf
    }*/
    
    func sendBookUrl(type: BookType, urlString: String) {
        var socket:GCDAsyncSocket!
        
        socket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        //    var error:NSError!
        
        do {
            try socket.connectToHost("192.168.0.44", onPort: 40000, withTimeout: 5)
        }
        catch {
            print("Socket exception.")
        }
        
        if !socket.isDisconnected {
            switch type{
            case .URL :
                print("Chosen to send URL to socket")
                
                socket.readDataWithTimeout(-1.0, tag: 0)
                
                let request:String = "URL\n"
                let data:NSData = request.dataUsingEncoding(NSUTF8StringEncoding)!
                socket.writeData(data, withTimeout: 0, tag: 0)
                socket.readDataWithTimeout(-1.0, tag: 0)
                
                let request2:String = urlString + "\n"
                let data2:NSData = request2.dataUsingEncoding(NSUTF8StringEncoding)!
                socket.writeData(data2, withTimeout: 0, tag: 0)
                socket.readDataWithTimeout(-1.0, tag: 0)
                
                
                let request3:String = "ready_to_receive\n"
                let data3:NSData = request3.dataUsingEncoding(NSUTF8StringEncoding)!
                socket.writeData(data3, withTimeout: 0, tag: 0)
                socket.readDataWithTimeout(-1.0, tag: 0)

            case .FILE :
                print("Chosen to send FiLE to socket")
                let request:String = "FILE\n"
                let data:NSData = request.dataUsingEncoding(NSUTF8StringEncoding)!
                socket.writeData(data, withTimeout: 0, tag: 0)
                socket.readDataWithTimeout(-1.0, tag: 0)

            default:
                print("Uncorrect file type.")
            }
        } else {
            print("Socket was not connected to host 192.168.0.44:40000.")
        }
        
        
    }
    
    
    func socket(sock: GCDAsyncSocket!, didConnectToHost host: String!, port: UInt16) {
        print("Conected!")
    }
    
    func socketDidDisconnect(sock: GCDAsyncSocket!, withError err: NSError!) {
        print("Dissconected!")
    }
    
    func socket(sock: GCDAsyncSocket!, didReadData data: NSData!, withTag tag: Int) {
        let str = NSString(data: data, encoding:NSUTF8StringEncoding )
        print("Read data from server: ", str)
    }
    
    func socket(sock: GCDAsyncSocket!, didReadPartialDataOfLength partialLength: UInt, tag: Int) {
        print("didReadPartialDataOfLength")
    }
    
    func socket(sock: GCDAsyncSocket!, didWriteDataWithTag tag: Int) {
        print("Data wroten.")
    }

}


/*func sendBookUrl(type: BookType, urlString: String) {
    var bsocket:GCDAsyncSocket!
    
    bsocket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
    //    var error:NSError!
    
    do {
        try bsocket.connectToHost("192.168.0.44", onPort: 40000, withTimeout: 5)
    }
    catch {
        print("Socket exception.")
    }
    
    if !bsocket.isDisconnected {
        let request:String = "Hello!\n"
        let data:NSData = request.dataUsingEncoding(NSUTF8StringEncoding)!
        bsocket.writeData(data, withTimeout: 0, tag: 0)
        bsocket.readDataWithTimeout(-1.0, tag: 0)
        
        let request2:String = "Hello2\n"
        let data2:NSData = request2.dataUsingEncoding(NSUTF8StringEncoding)!
        
        bsocket.writeData(data2, withTimeout: 5, tag: 0)
        bsocket.readDataWithTimeout(-1.0, tag: 0)
    } else {
        print("Socket was not connected to host 192.168.0.44:40000.")
    }
    
    
}

*/




