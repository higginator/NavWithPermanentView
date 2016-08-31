//
//  HIGNavController.h
//  NavWithPermanentView
//
//  Created by Ryan Higgins on 8/30/16.
//  Copyright © 2016 Ryan Higgins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HigNavController : UINavigationController

+ (HigNavController *)singleNav;
+ (HigNavController *)singleNavWithRootViewController:(UIViewController *)rootViewController;

@end
