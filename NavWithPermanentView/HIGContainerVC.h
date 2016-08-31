//
//  HigContainerVC.h
//  NavWithPermanentView
//
//  Created by Ryan Higgins on 8/31/16.
//  Copyright © 2016 Ryan Higgins. All rights reserved.
//

#import <UIKit/UIKit.h>

// HIGContainerVC allows childViewControllers to set their own frame within
// a navigation controller.
@interface HIGContainerVC : UIViewController

- (instancetype)initWithChildViewController:(UIViewController *)childVC;

@end
