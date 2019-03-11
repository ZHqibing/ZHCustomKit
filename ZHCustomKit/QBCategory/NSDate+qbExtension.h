//
//  NSDate+qbExtension.h
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/27.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (qbExtension)

/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否是本周
 */
- (BOOL)isThisWeek;
/**
 *  是否为今月
 */
- (BOOL)isThisMouth;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  获取13位时间戳
 */
- (NSInteger)getTimeSpaceBy13;



/**
 获取中国日历
 @return 字符串 eg:甲子年腊月廿六
 */
- (NSString *)getChinseDateString;



@end
