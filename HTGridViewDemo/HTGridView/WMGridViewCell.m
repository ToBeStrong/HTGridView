//
//  WMGridViewCell.m
//  
//
//  Created by sunchunlei on 16/4/17.
//
//

#import "WMGridViewCell.h"

@implementation WMGridViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self setFont:[UIFont systemFontOfSize:12]];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;

    }
    return self;
}


@end
