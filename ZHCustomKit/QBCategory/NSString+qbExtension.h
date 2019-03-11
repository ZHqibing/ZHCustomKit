//
//  NSString+qbExtension.h
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/27.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (qbExtension)

/**
 *  转为MD5
 */
- (NSString *)md5String;

/**
 获取文本size

 @param width 文本的宽度
 @param font 字号
 @return CGSize
 */
- (CGSize)getSizeByWidth:(CGFloat)width andFont:(UIFont *)font;

/**
 获取富文本size

 @param width 文本宽度
 @param attbute 富文本属性
 @return CGSize
 */
- (CGSize)getSizeByWidth:(CGFloat)width attbute:(NSDictionary <NSAttributedStringKey, id>*)attbute;

/**
 获取富文本的size

 @param width 文本宽度
 @param attStr 富文本
 @return CGSize
 */
+ (CGSize)getSizeByWidth:(CGFloat)width attbuteString:(NSAttributedString *)attStr;




@end
