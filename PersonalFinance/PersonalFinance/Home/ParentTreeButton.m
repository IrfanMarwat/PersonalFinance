//
//  TreeButton.m
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "ParentTreeButton.h"
#import <Foundation/Foundation.h>

@interface ParentTreeButton ()
@end

@implementation ParentTreeButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    self.frame = frame;
    self.layer.cornerRadius = frame.size.height/2;
    self.backgroundColor = [UIColor redColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.layer.borderWidth = 2;
    self.layer.borderColor = [[UIColor grayColor] CGColor];
    
    [self addTarget:self action:@selector(btnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
//    [self.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    
//    [self.titleLabel setFont:[UIFont fontWithName:@"Roboto-Regular" size:5]];
    
    return self;
}

- (void)btnPressed{
    if ([self.delegate respondsToSelector:@selector(nodeSelected:)]) {
        [self.delegate nodeSelected:self];
    }
    if (self.isExpanded) {
        [self collapseChildren];
    }
}

- (void)collapseChildren{
    for (UIButton *btn in self.children) {
        [UIView animateWithDuration:0.3 animations:^{
            btn.frame = self.frame;
        }completion:^(BOOL finished) {
            [btn removeFromSuperview];
        }];
    }
    self.selected = NO;
    self.isExpanded = NO;
}

- (void)expandChildren{
    int i = 0;
    for (UIButton *btn in self.children) {
        btn.frame = self.frame;
        [self.superview addSubview:btn];
        [UIView animateWithDuration:0.2 animations:^{
            btn.frame = CGRectMake((btn.frame.origin.x - (btn.frame.size.width*(i+1)) - (8*(i+1))), btn.frame.origin.y, btn.frame.size.width, btn.frame.size.height);
        }];
        i++;
    }
    self.selected = YES;
    
    self.isExpanded = YES;
}

- (CGFloat)delay{
    if (self.isExpanded) {
        return 0.3;
    }
    else
        return 0.0;
}

@end