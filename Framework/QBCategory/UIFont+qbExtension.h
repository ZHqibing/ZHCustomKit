//
//  UIFont+qbExtension.h
//  QBBasicKit
//
//  Created by sobeycloud on 2019/3/9.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (qbExtension)

/// 获取平方字体
+ (UIFont *)qb_pingfangRegularWithSize:(CGFloat)size;
+ (UIFont *)qb_pingfangMediumWithSize:(CGFloat)size;
+ (UIFont *)qb_pingfangBoldWithSize:(CGFloat)size;


#pragma mark --- 根据需求自定义字体样式
/**
 自定义字体需要手动实现，这里只是一个演示
 */
/**
 自定义常规字体，*** 注意这个方法需要手动实现 ***
 
 @param size 字体大小
 @return 字体
 */
+ (UIFont *)qb_customRegularWithSize:(CGFloat)size;

/**
 自定义中等字体，*** 注意这个方法需要手动实现 ***

 @param size 字体大小
 @return 字体
 */
+ (UIFont *)qb_customMediumWithSize:(CGFloat)size;

/**
 自定义加粗字体，*** 注意这个方法需要手动实现 ***

 @param size 字体大小
 @return 字体
 */
+ (UIFont *)qb_customBoldWithSize:(CGFloat)size;


@end

NS_ASSUME_NONNULL_END
