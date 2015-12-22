//
//  ParallaxHeader.h
//  ParallaxHeader
//
//  Created by cc on 15/12/22.
//  Copyright © 2015年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 基类。业务层header最好继承自ParallaxHeader, 以便于业务扩展（如定制子视图等）
 */

@interface ParallaxHeader : UIView

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) CGFloat parallaxRatio; // 0.0 ~ 1.0(or higher. better not, maybe.)

+ (instancetype)headerWithHeight:(CGFloat)height;
//... other stuff

@end
