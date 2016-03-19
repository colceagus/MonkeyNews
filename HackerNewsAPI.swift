//
//  HackerNewsAPI.swift
//  MonkeyNews
//
//  Created by training on 3/19/16.
//  Copyright © 2016 training. All rights reserved.
//

import UIKit

class HackerNewsAPI: NSObject {
    
    // let e pentru obiecte cu valoare imutabila
    static let newsStoryEndPoint:String = "https://hacker-news.firebaseio.com/v0/newstories.json";
    static let topStoryEndpoint:String = "https://hacker-news.firebaseio.com/v0/topstories.json"
    
    // daca vrem ca param sa isi poata schimba valoarea pe parcursul prelucrarii din functie
    static func storyEndopint(id:String) -> String {
        let _ = "ceva string id: \(id)"
        
        // \(numevariabila) => interpolare string variabila
        return "https://hacker-news.firebaseio.com/v0/item/\(id).json?print=pretty";
    }
    
    
}
