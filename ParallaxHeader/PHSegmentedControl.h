//
//  PHSegmentedControl.h
//  ParallaxHeader
//
//  Created by cc on 15/12/23.
//  Copyright © 2015年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PHSegmentedControl;
@protocol PHSegmentedControlDelegate <NSObject>

- (void)ph_segmentedControl:(PHSegmentedControl *)segmentedControl didSelectedItemAtIndex:(NSInteger)index;

@end

@interface PHSegmentedControl : UIControl

@property (nonatomic, weak) id<PHSegmentedControlDelegate> delegate;
@property (nonatomic, assign) NSInteger selectedIndex; // default is 0

@end
