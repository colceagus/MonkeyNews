//
//  StoryCollection.h
//  MonkeyNews
//
//  Created by training on 3/12/16.
//  Copyright © 2016 training. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoryModel.h"

@interface StoryCollection : NSObject

- (NSArray<StoryModel*>*) topStories;

- (void) addStory:(StoryModel*) newStory;

@end
