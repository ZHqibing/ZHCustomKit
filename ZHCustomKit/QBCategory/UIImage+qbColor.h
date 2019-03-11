//
//  UIImage+qbColor.h
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/21.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (qbColor)

/// 颜色转图片
+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size;

/// 根据颜色生产图片，透明地方不变
- (UIImage *)imageWithColor:(UIColor *)color;

/// 获取图片的主要颜色
- (UIColor *)mostColor;


@end
