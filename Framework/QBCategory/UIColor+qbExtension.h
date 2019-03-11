//
//  UIColor+qbExtension.h
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/21.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (qbExtension)


/// 由16进制字符串获取颜色 eg:[UIColor colorWithHexString:@"#666666" alpha:0.2]
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(float)alpha;


/// 根据16进制数据 和透明度 获取颜色 eg:[UIColor colorWithHexValue:0x777777 alpha:0.5]
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue;
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue alpha:(float)alpha;


/// 由R G B A 获取颜色 eg:[UIColor colorWithRed:123 green:134 blue:234 alpha:0.5]
+ (UIColor *)getColorWithRed:(int)red green:(int)green blue:(int)blue;
+ (UIColor *)getColorWithRed:(int)red green:(int)green blue:(int)blue alpha:(float)alpha;



@end
