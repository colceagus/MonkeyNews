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
// pentru a face available clasele din swift in objC
#import "MonkeyNews-Swift.h"

@interface ViewController ()

@property (nonatomic) StoryModel* selectedStory;

@end

@implementation ViewController


// - non-static
// + statica
- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

// Metoda de pe delegate-ul de pe datasource (cate randuri sunt intr-o sectiune) iti cere un view
// pentru cell-ul tau
- (StoryTableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellID = @"storyCellId";
    StoryTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.titleLabel.text = _dataSource[indexPath.row].title;
    cell.idLabel.text = _dataSource[indexPath.row].id;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedStory = _dataSource[indexPath.row];
    
    [self performSegueWithIdentifier:@"go_to_show_story" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"go_to_show_story"]) {
        StoryViewController* dest = (StoryViewController*) segue.destinationViewController;
        [dest goToURL:self.selectedStory.url];
    }
    
}

- (void) setDataSource:(NSArray<StoryModel*>*) dataSource {
    _dataSource = dataSource;
    
    [self.storiesTable reloadData];
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
