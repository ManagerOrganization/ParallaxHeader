//
//  TherbligsViewModel.m
//  ParallaxHeader
//
//  Created by cc on 15/12/23.
//  Copyright © 2015年 cc. All rights reserved.
//

#import "TherbligsViewModel.h"

@implementation TherbligsViewModel

- (void)fetchingDataWithParameters:(NSDictionary *)parameters succeed:(PHFetchSucceed)succeed failed:(PHFetchFailed)failed {
    // do fetching with parameters...
    
    // when fetching data success
    if (succeed) {
        id response; // the response data from server. here, just demo
        succeed(response);
        
        // then cache them !!!
    }
    
    // while the server sucks ;[
    if (failed) {
        NSError *error; // the error info from server. here, just demo
        failed(error);
    }
}

- (void)updateCacheWithNewData:(id)newData {
    // caching... original data, usually
}

/**
 * !!! IMPORTANT: ALWAYS PARSE FROM CACHE
 */
- (NSInteger)numberOfSections {
    return 0;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (id<PHTimelineData> _Nullable)dataItemAtIndexPath:( NSIndexPath * _Nonnull)indexPath {
    return nil;
}

@end
