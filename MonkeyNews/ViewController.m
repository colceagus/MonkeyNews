//
//  ViewController.m
//  MonkeyNews
//
//  Created by training on 3/12/16.
//  Copyright © 2016 training. All rights reserved.
//

#import "ViewController.h"
#import "StoryCollection.h"
#import "StoryTableViewCell.h"

@interface ViewController () {
    StoryCollection* _dataSource;
}

@end

@implementation ViewController


// - non-static
// + statica
- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        // aloca memorie -> initializeaza
        // new cheama el alloc si apoi init
        _dataSource = [[StoryCollection alloc ]init];
        StoryModel* newStory ;
        for (int i = 0; i < 10; i++) {
            newStory = [StoryModel new];
            
            newStory.title = [NSString stringWithFormat:@"title %d", i];
            newStory.id = [NSString stringWithFormat:@"id %d", i];
            newStory.url = [NSString stringWithFormat:@"http://myapi.com/story?id=%d", i];
            
            [_dataSource addStory:newStory];
        }
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.topStories.count;
}

// Metoda de pe delegate-ul de pe datasource (cate randuri sunt intr-o sectiune) iti cere un view
// pentru cell-ul tau
- (StoryTableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellID = @"storyCellId";
    StoryTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.titleLabel.text = _dataSource.topStories[indexPath.row].title;
    cell.idLabel.text = _dataSource.topStories[indexPath.row].id;
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
