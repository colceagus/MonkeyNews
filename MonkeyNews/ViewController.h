//
//  ViewController.h
//  MonkeyNews
//
//  Created by training on 3/12/16.
//  Copyright © 2016 training. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryModel.h"
@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray<StoryModel*>* dataSource;

@property (weak, nonatomic) IBOutlet UITableView *storiesTable;

@end

