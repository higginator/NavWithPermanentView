//
//  HIGMusicPlayerView.m
//  NavWithPermanentView
//
//  Created by Ryan Higgins on 8/25/16.
//  Copyright © 2016 Higgnet. All rights reserved.
//

#import "HIGMusicPlayerView.h"

static UILabel *songLabel;

@interface HIGMusicPlayerView ()
@property UIButton *playPauseButton;

@end

@implementation HIGMusicPlayerView

+ (HIGMusicPlayerView *)musicPlayerView {
    static HIGMusicPlayerView *musicPlayerView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        musicPlayerView = [[HIGMusicPlayerView alloc] init];
    });
    return musicPlayerView;
}

- (instancetype)init {
    if (self) {
        CGRect mainScreenFrame = [[UIScreen mainScreen] bounds];
        NSInteger musicPlayerHeight = 50;
        NSInteger yStart = mainScreenFrame.size.height - musicPlayerHeight;
        CGRect musicPlayerFrame = CGRectMake(0,
                                             yStart,
                                             mainScreenFrame.size.width,
                                             musicPlayerHeight);
        UIView *view = [[UIView alloc] initWithFrame:musicPlayerFrame];
        view.backgroundColor = [self musicPlayerColor];
        _playPauseButton = [self
                        makePlayPauseButtonWithParentFrame:musicPlayerFrame];
        [view addSubview:_playPauseButton];
        songLabel = [self makeSongLabelWithParentFrame:musicPlayerFrame];
        [view addSubview:songLabel];
        self = (HIGMusicPlayerView *)view;
    }
    return self;
}

+ (void)setSongName:(NSString *)songName {
    songLabel.text = songName;
}

- (UILabel *)makeSongLabelWithParentFrame:(CGRect)musicPlayerFrame {
    NSInteger songTitlePaddingLeft = 10;
    NSInteger songTitlePaddingTop = 5;
    NSInteger songWidth = 320;
    NSInteger songHeight = 40;
    CGRect songTitleFrame = CGRectMake(songTitlePaddingLeft,
                                        songTitlePaddingTop,
                                        songWidth,
                                        songHeight);
    UILabel *songLabel = [[UILabel alloc] initWithFrame:songTitleFrame];
    [songLabel setTextColor:[UIColor whiteColor]];
    songLabel.text = @"";
    songLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    songLabel.backgroundColor = [UIColor clearColor];
    return songLabel;
}

- (UIButton *)makePlayPauseButtonWithParentFrame:(CGRect)musicPlayerFrame {
    NSInteger buttonWidth = 34;
    NSInteger buttonWidthPadding = 8;
    NSInteger buttonHeight = 34;
    CGRect playPauseButtonFrame = CGRectMake(musicPlayerFrame.size.width -
                                             buttonWidth - buttonWidthPadding,
                                             buttonWidthPadding,
                                             buttonWidth,
                                             buttonHeight);
    UIButton *button = [[UIButton alloc] initWithFrame:playPauseButtonFrame];
    button.backgroundColor = [UIColor clearColor];
    [button.layer addSublayer:[self playLayer]];
    return button;
}

- (UIBezierPath *)playPath {
    UIBezierPath *playPath = [UIBezierPath bezierPath];
    CGPoint startPoint, secondPoint, endPoint;
    startPoint = CGPointMake(0, 0);
    secondPoint = CGPointMake(0, 34);
    endPoint = CGPointMake(34, 17);
    [playPath moveToPoint:startPoint];
    [playPath addLineToPoint:secondPoint];
    [playPath addLineToPoint:endPoint];
    return playPath;
}

- (CALayer *)playLayer {
    UIBezierPath *playPath = [self playPath];
    CAShapeLayer *playLayer = [CAShapeLayer layer];
    playLayer.path = playPath.CGPath;
    playLayer.fillColor = [UIColor whiteColor].CGColor;
    return playLayer;
}

#pragma mark - Methods

- (UIColor *)musicPlayerColor {
    return [UIColor colorWithRed:55/255.0
                           green:74/255.0
                            blue:103/255.0
                           alpha:1.0];
}

@end
