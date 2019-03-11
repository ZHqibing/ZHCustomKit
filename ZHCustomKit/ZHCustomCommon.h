//
//  ZHCustomCommon.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/11.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/** 屏幕宽高常量 */
#define zh_screen_width  [UIScreen mainScreen].bounds.size.width
#define zh_screen_height [UIScreen mainScreen].bounds.size.height
#define zh_screen_size   [UIScreen mainScreen].bounds.size
/**  屏幕宽度与375 的比例 */
#define zh_screen_scale  [UIScreen mainScreen].bounds.size.width / 375.
/** 判断屏幕是否是刘海屏幕 */
#define zh_is_iphoneX    CGSizeEqualToSize(zh_screen_size, CGSizeMake(375, 812)) || CGSizeEqualToSize(zh_screen_size, CGSizeMake(414, 896))


/** 自定义打印函数。。 */
#ifdef DEBUG

#define ZHLog(FORMAT, ...) fprintf(stderr,"%s 第%d行 >>%s<< : %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__,[[NSString stringWithFormat:@"%@", [NSDate date]] UTF8String], [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

#else

#define ZHLog(...)

#endif




@interface ZHCustomCommon : NSObject

+ (instancetype)shareCommon;

- (BOOL)isIphoneX;


@end

NS_ASSUME_NONNULL_END
