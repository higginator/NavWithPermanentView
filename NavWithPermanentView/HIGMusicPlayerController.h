//
//  HIGMusicPlayerController.h
//  NavWithPermanentView
//
//  Created by Ryan Higgins on 8/30/16.
//  Copyright © 2016 Higgnet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HIGMusicPlayerController : UIViewController

+ (HIGMusicPlayerController *)musicPlayer;
- (void)setupView;
- (void)setSongName:(NSString *)songName;
@end
