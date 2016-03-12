//
//  StoryModel.h
//  MonkeyNews
//
//  Created by training on 3/12/16.
//  Copyright © 2016 training. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryModel : NSObject

// default atomic, in orice moment starea obiectului este persistenta
// bazat pe tranzactii, ori accesezi inainte sau dupa ce s-a facut get/set.
@property (nonatomic) NSString* title;
@property (nonatomic) NSString* id;
@property (nonatomic) NSString* url;

@end
