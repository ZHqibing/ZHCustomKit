//
//  UIColor+qbExtension.m
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/21.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import "UIColor+qbExtension.h"
#define DEFAULT_VOID_COLOR [UIColor whiteColor]

@implementation UIColor (qbExtension)


+ (UIColor *)colorWithHexString:(NSString *)stringToConvert{
    
    return [UIColor colorWithHexString:stringToConvert alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(float)alpha {
    
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return DEFAULT_VOID_COLOR;
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] == 3) {
        /// 3f8 -> 33ff88
        //        cString = cString;
        //        char arr[3] = [cString ]
    }
    if ([cString length] != 6) {
        return DEFAULT_VOID_COLOR;
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}


+ (UIColor *) colorWithHexValue:(NSUInteger)hexValue {
    return [self colorWithHexValue:hexValue alpha:1];
}

+ (UIColor *) colorWithHexValue:(NSUInteger) hexValue alpha:(float)alpha{
    
    CGFloat red = ((hexValue & 0xFF0000) >> 16) / 255.0;
    CGFloat green = ((hexValue & 0xFF00) >> 8) / 255.0;
    CGFloat blue = (hexValue & 0xFF) / 255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
}

+ (UIColor *)getColorWithRed:(int)red green:(int)green blue:(int)blue {
    
    return [UIColor getColorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *) getColorWithRed:(int)red green:(int)green blue:(int)blue alpha:(float)alpha {
    
    if (red > 255) {
        red = 255;
    }
    if (green > 255) {
        green = 255;
    }
    if (blue > 255) {
        blue = 255;
    }
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}




@end
