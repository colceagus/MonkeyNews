//
//  StoryCollection.m
//  MonkeyNews
//
//  Created by training on 3/12/16.
//  Copyright © 2016 training. All rights reserved.
//

#import "StoryCollection.h"

// extensie
@interface StoryCollection()

@property (nonatomic) NSMutableArray<StoryModel*>* stories;

@end

@implementation StoryCollection

- (instancetype) init {
    self = [super init];
    
    if (self) {
        self.stories = [NSMutableArray new];
    }
    
    return self;
}


- (void) addStory:(StoryModel *) newStory {
    [self.stories addObject:newStory];
}

- (NSArray<StoryModel*> *) topStories {
    
    NSInteger howMany = 10;
    if (howMany > self.stories.count) {
        howMany = self.stories.count;
    }
    
    NSArray<StoryModel*> * ret = [self.stories subarrayWithRange:NSMakeRange(0, howMany)];
    
    return ret;
}

@end
