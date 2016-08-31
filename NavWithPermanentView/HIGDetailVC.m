//
//  HIGDetailVC.m
//  NavWithPermanentView
//
//  Created by Ryan Higgins on 8/29/16.
//  Copyright © 2016 Ryan Higgins. All rights reserved.
//

#import "HIGDetailVC.h"
#import "AppDelegate.h"
#import "HIGMessageCell.h"
#import "HigNavController.h"
#import "HIGMusicPlayerController.h"

@interface HIGDetailVC ()

@property NSMutableArray *objs;

@end

@implementation HIGDetailVC

static NSString * const reuseIdentifier = @"MessageCell2";

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.objs = [[NSMutableArray alloc] init];
        [self makeObjs];
        [self setTitle:@"Detail"];
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[HIGMessageCell class]
           forCellReuseIdentifier:reuseIdentifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Set frame to account for MusicPlayerView (height 50)
    // View already accounts for status bar (height 20)
    CGRect tableViewFrame = CGRectMake(0,
                                       0,
                                       self.view.bounds.size.width,
                                       self.view.bounds.size.height - 30);
    self.tableView.frame = tableViewFrame;
    self.tableView.backgroundColor = [UIColor yellowColor];


}


#pragma mark - Methods

- (void)makeObjs {
    for (int i = 123000; i < 123030; i++) {
        [self.objs addObject:[NSString stringWithFormat:@"%d", i]];
    }
}


#pragma mark - TableViewDelegate

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Set MusicPlayer title
    HIGMessageCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [[HIGMusicPlayerController musicPlayer] setSongName:cell.messageName.text];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
    return [self.objs count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HIGMessageCell *cell = [tableView
                            dequeueReusableCellWithIdentifier:reuseIdentifier];
    NSString *someText = [self.objs objectAtIndex:indexPath.row];
    cell.messageName.text = someText;
    return cell;
}

@end
