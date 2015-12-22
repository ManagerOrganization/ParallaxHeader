//
//  PHDemoHeader.m
//  ParallaxHeader
//
//  Created by cc on 15/12/22.
//  Copyright © 2015年 cc. All rights reserved.
//

#import "PHDemoHeader.h"

@interface PHDemoHeader ()

@property (nonatomic, strong) UIToolbar *toolBar;

@end

@implementation PHDemoHeader

// MARK: init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.toolBar];
    }
    return self;
}

// MARK: layout

// 也可autolayout, anyway.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.toolBar.frame = CGRectMake(0, CGRectGetHeight(self.bounds) - 40, CGRectGetWidth(self.bounds), 40);
}

// MARK: getters

- (UIToolbar *)toolBar {
    if (!_toolBar) {
        UIToolbar *bar = [UIToolbar new];
        bar.barStyle = UIBarStyleDefault;
        _toolBar = bar;
    }
    return _toolBar;
}

@end
