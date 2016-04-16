//
//  PushAPI.swift
//  MonkeyNews
//
//  Created by Mobile Academy on 16/04/16.
//  Copyright © 2016 training. All rights reserved.
//

import Foundation

class PushAPI {
    static let endpoint:String = "http://10.10.0.162/newsreaderpush/public";
    
    static func addToken(token:String) -> String {
        return "\(endpoint)/add_token/\(token)'";
    }
    
    static func sendMessage(message:String) -> String {
        return "\(endpoint)/send_notification/\(message)";
    }
}