//
//  PushComm.swift
//  MonkeyNews
//
//  Created by Mobile Academy on 16/04/16.
//  Copyright © 2016 training. All rights reserved.
//

import Foundation

class PushComm:NSObject {
    static func addToken(token:String) {
        let url = NSURL(string: PushAPI.addToken(token))!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            print(response)
        }
        task.resume()
    }
    
    static func sendMessage(message:String) {
        let url = NSURL(string: PushAPI.sendMessage(message))!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            print(response)
        }
        
        task.resume()
    }
}