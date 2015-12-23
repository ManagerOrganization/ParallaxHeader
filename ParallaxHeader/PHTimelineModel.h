//
//  PHTimelineModel.h
//  ParallaxHeader
//
//  Created by cc on 15/12/23.
//  Copyright © 2015年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PHFetchSucceed)(id _Nullable response);
typedef void(^PHFetchFailed)( NSError * _Nullable error);

@protocol PHTimelineData;
@protocol PHTimelineModel <NSObject>

- (NSInteger)numberOfSections;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;
// 便于扩展, 任何符合该协议的数据结构都支持
- (id<PHTimelineData> _Nullable)dataItemAtIndexPath:( NSIndexPath * _Nonnull)indexPath;

// fetching...
- (void)fetchingDataWithParameters:( NSDictionary * _Nullable)parameters
                           succeed:(PHFetchSucceed _Nullable)succeed
                            failed:(PHFetchFailed _Nullable)failed;

- (void)updateCacheWithNewData:(id _Nullable)newData;

@end

@protocol PHTimelineData <NSObject>

@property (nonatomic, strong, nullable) UIImage * avatar; // 实际应该是image.URL.string
@property (nonatomic, copy, nullable) NSString * title;
@property (nonatomic, copy, nullable) NSString * content;
//...etc.

@end
