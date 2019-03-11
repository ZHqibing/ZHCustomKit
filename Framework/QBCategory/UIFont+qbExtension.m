//
//  UIFont+qbExtension.m
//  QBBasicKit
//
//  Created by sobeycloud on 2019/3/9.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "UIFont+qbExtension.h"

@implementation UIFont (qbExtension)

+ (UIFont *)pingfangRegularWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

+ (UIFont *)pingfangMediumWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

+ (UIFont *)pingfangBoldWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}






#pragma mark ---- 自定义字体


/**
 自定义常规字体
 
 @param size 字体大小
 @return 字体
 */
+ (UIFont *)qb_customRegularWithSize:(CGFloat)size {
    
    // eg
    UIFont *font;
    font = [UIFont fontWithName:@"Copperplate-Light" size:size];
    
    return nil;
}

/**
 自定义中等字体
 
 @param size 字体大小
 @return 字体
 */
+ (UIFont *)qb_customMediumWithSize:(CGFloat)size {
    
    // eg
    UIFont *font;
    font = [UIFont fontWithName:@"Copperplate" size:size];
    
    return nil;
}

/**
 自定义加粗字体
 
 @param size 字体大小
 @return 字体
 */
+ (UIFont *)qb_customBoldWithSize:(CGFloat)size {
    
    // eg
    UIFont *font;
    font = [UIFont fontWithName:@"Copperplate-Bold" size:size];
    
    return nil;
}

/**
 *  1、如果需要获取到系统的字体，可以采用方法 +familyNames 获取所有字体族
 *  方法原型：[UIFont familyNames];
 *  eg： NSArray *familyNames = [UIFont familyNames];
 
    eg:
        "PingFang SC",
        "PingFang TC",
        "Heiti TC",
        ...
 
 等都为系统可以支持的字体。。
 
 */

/**
 *  2、获取指定 fontName 的所有 font
 *  原型：arr = [UIFont fontNamesForFamilyName:@"PingFang SC"];
 *  那么获取指定字体的具体样式：PingFangSC-Medium
 *  eg： UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
 
 PingFangSC-Medium,
 PingFangSC-Semibold,
 PingFangSC-Light,
 PingFangSC-Ultralight,
 PingFangSC-Regular,
 PingFangSC-Thin
 
 */




@end
