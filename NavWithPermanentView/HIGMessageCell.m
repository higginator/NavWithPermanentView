//
//  HIGMessageCell.m
//  NavWithPermanentView
//
//  Created by Ryan Higgins on 8/29/16.
//  Copyright © 2016 Ryan Higgins. All rights reserved.
//

#import "HIGMessageCell.h"

@implementation HIGMessageCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    [self createMessageLabel];
}

- (void)createMessageLabel {
    CGRect messageFrame = CGRectMake(50, 5, 310, 30);
    UILabel *messageName = [[UILabel alloc] initWithFrame:messageFrame];
    messageName.backgroundColor = [UIColor greenColor];
    self.messageName = messageName;
    [self addSubview:messageName];
}

@end
