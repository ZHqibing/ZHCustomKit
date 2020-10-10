//
//  NSObject+qbAutoArchive.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/17.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (qbAutoArchive)

#pragma mark --- 文件自动归解档
/**
 自动归档

 @param aCoder
 */
- (void)modelEncodeWithCoder:(NSCoder *)aCoder;
/**
 自动解档

 @param aDecoder
 @return 返回self
 */
- (id)modelInitWithWithCode:(NSCoder *)aDecoder;


#pragma mark --- 文件归解档
/**
 调用归档的方法；
 
 @param file 归档的文件名，是文件名，不是文件路径。如果不传，则使用系统默认的文件名。
 @return 返回归档结果
 */
- (BOOL)archiveSelfWithFile:(NSString * __nonnull)file;
/**
 调用解档的方法；
 
 @param file 解档的文件名，是文件名，不是文件路径。如果不传，则使用系统默认的文件名。
 @return 返回一个ID对象。
 */
+ (id)unArchiveSelfWithFile:(NSString * __nonnull)file;


@end

NS_ASSUME_NONNULL_END
