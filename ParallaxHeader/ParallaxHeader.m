//
//  ParallaxHeader.m
//  ParallaxHeader
//
//  Created by cc on 15/12/22.
//  Copyright © 2015年 cc. All rights reserved.
//

#import "ParallaxHeader.h"

typedef void(^Something)();
#define PH_DEFAULT_PARALLAX_RATIO 0.5f

@interface ParallaxHeader ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ParallaxHeader

static NSString * const PH_SCROLL_OFFSET = @"contentOffset";

// MAKR: public

- (void)setParallaxRatio:(CGFloat)parallaxRatio {
    _parallaxRatio = fmin(parallaxRatio, 1.0f);
    
    [self setNeedsLayout];
    
    [self updateParallaxEffect];
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}

// MARK: life

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];

    [self removeKVOSafely];
    if ([newSuperview isKindOfClass:[UIScrollView class]]) {
        self.scrollView = (UIScrollView *)newSuperview;
    }
    [self addKVOSafely];
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
    
    [self removeKVOSafely];
}

- (void)removeKVOSafely {
    if (self.scrollView) {
        @try {
            [self.scrollView removeObserver:self forKeyPath:PH_SCROLL_OFFSET context:nil];
        }
        @catch (NSException *exception) {
            NSLog(@"!!! REMOVE OBSERVER ERROR: %@",exception);
        }
    }
}

- (void)addKVOSafely {
    if (self.scrollView) {
        @try {
            [self.scrollView addObserver:self forKeyPath:PH_SCROLL_OFFSET options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew context:nil];
        }
        @catch (NSException *exception) {
            NSLog(@"!!! ADD OBSERVER ERROR: %@",exception);
        }
    }
}

// MARK: kvo

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:PH_SCROLL_OFFSET]) {
        [self updateParallaxEffect];
    }
}

// MARK: private

- (void)updateParallaxEffect {
    CGRect frame = self.imageView.frame;
    CGFloat offsetY = self.scrollView.contentOffset.y;
    
    if (self.scrollView.contentOffset.y > 0) {
        frame.origin.y = fmax(0, offsetY * self.parallaxRatio);
        self.imageView.frame = frame;
    } else {
        frame.origin.y = fmin(0, offsetY * self.parallaxRatio);
        self.imageView.frame = frame;
    }
}

// MAKR: initialization

+ (instancetype)headerWithHeight:(CGFloat)height {
    CGRect rect = CGRectZero;
    rect.size.height = height;
    return [[self new] initWithFrame:rect];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, CGRectGetWidth(self.superview.frame), CGRectGetHeight(frame));
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        // default. 如果header'bounds以外的区域不想可见, 则需将该属性设置为no
        self.clipsToBounds = YES;
        
        [self addSubview:self.imageView];
        
        self.parallaxRatio = PH_DEFAULT_PARALLAX_RATIO;
    }
    return self;
}

- (void)dealloc {
    [self removeKVOSafely];
}

// MARK: layout

// 也可autolayout, anyway.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    rect.size.height = CGRectGetHeight(rect) * (self.parallaxRatio + 1); // 放大1.x倍
    self.imageView.frame = rect;
}

// MARK: getters

- (UIImageView *)imageView {
    if (!_imageView) {
        UIImageView *view = [UIImageView new];
        view.contentMode = UIViewContentModeScaleAspectFill;

        _imageView = view;
    }
    return _imageView;
}

@end
