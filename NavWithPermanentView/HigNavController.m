//
//  HIGNavController.m
//  NavWithPermanentView
//
//  Created by Ryan Higgins on 8/30/16.
//  Copyright © 2016 Ryan Higgins. All rights reserved.
//

#import "HigNavController.h"
#import "HIGMusicPlayerController.h"

@interface HigNavController ()

@property UIViewController *vc;

@end

@implementation HigNavController

+ (HigNavController *)singleNav {
    return [HigNavController singleNavWithRootViewController:nil];
}

+ (HigNavController *)singleNavWithRootViewController:(UIViewController *)rootViewController {
    static HigNavController *singleNav = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleNav = [[HigNavController alloc] initWithRootViewController:rootViewController];
    });
    return singleNav;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        _vc = rootViewController;
        self.view.autoresizesSubviews = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addPermanentView];
}

- (void)addPermanentView {
    HIGMusicPlayerController *player = [HIGMusicPlayerController musicPlayer];
    [self addChildViewController:player];
    [player setupView];
    [self.view addSubview:player.view];
    [player didMoveToParentViewController:self];
}


@end
