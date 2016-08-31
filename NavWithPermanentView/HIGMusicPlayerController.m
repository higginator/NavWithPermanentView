//
//  HIGMusicPlayerController.m
//  NavWithPermanentView
//
//  Created by Ryan Higgins on 8/30/16.
//  Copyright © 2016 Higgnet. All rights reserved.
//

#import "HIGMusicPlayerController.h"
#import "HIGMusicPlayerView.h"

@implementation HIGMusicPlayerController

#pragma mark - Initialization

+ (HIGMusicPlayerController *)musicPlayer {
    static HIGMusicPlayerController *player = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[HIGMusicPlayerController alloc] init];
    });
    return player;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setupView {
    self.view = [HIGMusicPlayerView musicPlayerView];
}

- (void)setSongName:(NSString *)songName {
    [HIGMusicPlayerView setSongName:songName];
}

@end
