//
//  HackerNewsComm.swift
//  MonkeyNews
//
//  Created by training on 3/19/16.
//  Copyright © 2016 training. All rights reserved.
//

import UIKit

class HackerNewsComm {
    
    func fetchTopStories(completionHandler: (StoryCollection) -> Void) -> Void {
        let url = NSURL(string: HackerNewsAPI.topStoryEndpoint)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
            print (data)
            
        });
        
        // Task was already created, started and paused,
        // Resume it to continue with execution
        task.resume()
        
        completionHandler(StoryCollection())
    }
    
    func fetchNewStories() -> StoryCollection {
        return StoryCollection()
    }
}
