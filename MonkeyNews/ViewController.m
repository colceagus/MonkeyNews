//
//  ViewController.m
//  MonkeyNews
//
//  Created by training on 3/12/16.
//  Copyright © 2016 training. All rights reserved.
//

#import "ViewController.h"
#import "StoryCollection.h"

@interface ViewController () {
    StoryCollection* _dataSource;
}

@end

@implementation ViewController

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        // aloca memorie -> initializeaza
        // new cheama el alloc si apoi init
        _dataSource = [[StoryCollection alloc ]init];
        
        StoryModel* newStory = [StoryModel new];
        newStory.title = [NSString stringWithFormat:@"title %d", 1];
        newStory.id = [NSString stringWithFormat:@"id %d", 1];
        newStory.url = [NSString stringWithFormat:@"http://myapi.com/story?id=%d", 1];
        
        [_dataSource addStory:newStory];
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.topStories.count;
}

// Metoda de pe delegate-ul de pe datasource (cate randuri sunt intr-o sectiune) iti cere un view
// pentru cell-ul tau
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"readerCellId"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"readerCellId"];
    }
    
    cell.textLabel.text = _dataSource.topStories[indexPath.row].title;
    
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
