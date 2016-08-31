//
//  HigContainerVC.m
//  NavWithPermanentView
//
//  Created by Ryan Higgins on 8/31/16.
//  Copyright © 2016 Ryan Higgins. All rights reserved.
//

#import "HIGContainerVC.h"
#import "HIGTableVC.h"

@interface HIGContainerVC ()

@end

@implementation HIGContainerVC

- (instancetype)init {
    return [self initWithChildViewController:nil];
}

- (instancetype)initWithChildViewController:(UIViewController *)childVC {
    self = [super init];
    if (self) {
        [self addChildViewController:childVC];
        [childVC didMoveToParentViewController:self];
        self.title = childVC.title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *child = [self.childViewControllers objectAtIndex:0];
    [self.view addSubview:child.view];
}

@end
