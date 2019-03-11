//
//  NSString+qbExtension.m
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/27.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import "NSString+qbExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (qbExtension)

- (NSString *)md5String {
    
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int) strlen(cStr), result);
    NSString *md5Str = [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
    
    return md5Str;
}


- (CGSize)getSizeByWidth:(CGFloat)width andFont:(UIFont *)font {
    
    return [self getSizeByWidth:width attbute:@{NSFontAttributeName:font}];
}

- (CGSize)getSizeByWidth:(CGFloat)width attbute:(NSDictionary<NSAttributedStringKey,id> *)attbute {
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attbute context:nil];
    
    return rect.size;
}

+ (CGSize)getSizeByWidth:(CGFloat)width attbuteString:(NSAttributedString *)attStr {
    
    CGRect rect = [attStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) context:nil];
    
    return rect.size;
}




@end
