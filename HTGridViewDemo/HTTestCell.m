//
//  HTTestCell.m
//  
//
//  Created by sunchunlei on 16/4/17.
//
//

#import "HTTestCell.h"

@implementation HTTestCell

- (void)setNameTitle:(NSString *)nameTitle{
    
    _nameTitle = nameTitle;
    [self setTitle:nameTitle forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
}
@end
