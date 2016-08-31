//
//  AppDelegate.m
//  NavWithPermanentView
//
//  Created by Ryan Higgins on 8/30/16.
//  Copyright © 2016 Ryan Higgins. All rights reserved.
//

#import "AppDelegate.h"
#import "HIGContainerVC.h"
#import "HIGTableVC.h"
#import "HigNavController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    HIGTableVC *tableVC = [[HIGTableVC alloc] init];
    HIGContainerVC *containerVCForTableVC = [[HIGContainerVC alloc]
                         initWithChildViewController:tableVC];
    HigNavController *HIGNav =
    [HigNavController singleNavWithRootViewController:containerVCForTableVC];
    self.window.rootViewController = HIGNav;
    return YES;
}

@end
