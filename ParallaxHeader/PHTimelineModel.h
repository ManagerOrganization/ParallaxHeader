//
//  PHTimelineModel.h
//  ParallaxHeader
//
//  Created by cc on 15/12/23.
//  Copyright © 2015年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PHTimelineData;
@protocol PHTimelineModel <NSObject>

- (NSInteger)numberOfSections;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;
// 便于扩展, 任何符合该协议的数据结构都支持
- (id<PHTimelineData>)dataItemAtIndexPath:(NSIndexPath *)indexPath;

@end


@protocol PHTimelineData <NSObject>

@property (nonatomic, strong) UIImage *avatar; // 实际应该是image.URL.string
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
//...etc.

@end
