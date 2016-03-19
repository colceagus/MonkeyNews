//
//  HackerNewsComm.swift
//  MonkeyNews
//
//  Created by training on 3/19/16.
//  Copyright © 2016 training. All rights reserved.
//

import UIKit
import SwiftyJSON

class HackerNewsComm {
    
    // specific tipul de return
    func fetchTopStories(completionHandler: (StoryCollection) -> Void) -> Void {
        let url = NSURL(string: HackerNewsAPI.topStoryEndpoint)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
            let collection = StoryCollection()
            
            let json = JSON(data:data!)
            
            for (key, value) in json {
                let story = StoryModel()
                story.id = String(value.int!)
                
                
                collection.addStory(story)
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                completionHandler(collection);
            }
        });
        
        // Task was already created, started and paused,
        // Resume it to continue with execution
        task.resume()
        
        
    }
    
    // returneaza void implicit
    func populateStory(story: StoryModel, completionHandler:(StoryModel)->Void) {
        
        let url = NSURL(string: HackerNewsAPI.topStoryEndpoint);
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler:{
            (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
                // safer than before
                if let safeData:NSData = data! {
                    let json = JSON(data: safeData)
                    
                    story.url = json["url"].string
                    story.title = json["title"].string
                    
                    completionHandler(story)
                }
            
        });
        
        task.resume()
    }
    
    func fetchNewStories() -> StoryCollection {
        return StoryCollection()
    }
}
