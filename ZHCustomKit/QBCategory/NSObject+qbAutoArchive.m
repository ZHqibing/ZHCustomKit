//
//  NSObject+qbAutoArchive.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/17.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "NSObject+qbAutoArchive.h"
#import <objc/runtime.h>
#import <objc/objc.h>

@implementation NSObject (qbAutoArchive)

#pragma mark ---- 文件自动归解档
- (void)modelEncodeWithCoder:(NSCoder *)aCoder {
    
    if (aCoder == nil) return;
    if (self == (id)kCFNull) return;
    
    unsigned int count = 0;
    objc_property_t *plist = class_copyPropertyList(object_getClass(self), &count);
    for (int i = 0; i < count; i++) {
        
        const char *cname = property_getName(plist[i]);
        NSString *name = [NSString stringWithCString:cname encoding:NSUTF8StringEncoding];
        id value = [self valueForKey:name];
        if (value) {
            [aCoder encodeObject:value forKey:name];
        }
        
    }
    
}

- (id)modelInitWithWithCode:(NSCoder *)aDecoder {
    
    if (aDecoder == nil) return self;
    if (self == (id)kCFNull) return self; 
    
    unsigned int count = 0;
    objc_property_t *plist = class_copyPropertyList(object_getClass(self), &count);
    for (int i = 0; i < count; i++) {
        
        const char *cname = property_getName(plist[i]);
        NSString *name = [NSString stringWithCString:cname encoding:NSUTF8StringEncoding];
        id value = [aDecoder decodeObjectForKey:name];
        if (value) {
            [self setValue:value forKey:name];
        }
    }
    
    return self;
}


#pragma mark ---  归档和解档
- (BOOL)archiveSelfWithFile:(NSString *)file {
    /// 文件名
    NSString *fileName = NSStringFromClass(self.class);
    if (file.length > 0) {
        fileName = file;
    }
    /// 文件路径
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject] stringByAppendingPathComponent:fileName];
    /// 判断文件夹存在与否
    BOOL suc = [self fileExistsAtPath:filePath];
    if (suc) {
    }
    BOOL res = [NSKeyedArchiver archiveRootObject:self toFile:filePath];
    
    return res;
}
+ (id)unArchiveSelfWithFile:(NSString *)file {
    /// 文件名
    NSString *fileName = NSStringFromClass(self.class);
    if (file.length > 0) {
        fileName = file;
    }
    /// 文件路径
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject] stringByAppendingPathComponent:fileName];
    id obj = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    return obj;
}


- (BOOL)fileExistsAtPath:(NSString *)filePath {
    
    // 去掉最后一个
    NSString *directory = [filePath stringByReplacingOccurrencesOfString:[filePath lastPathComponent] withString:@""];
    
    /// 判断文件夹是否存在
    if (![[NSFileManager defaultManager] fileExistsAtPath:directory]) {
        NSError *err = nil;
        BOOL suc = [[NSFileManager defaultManager] createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:&err];
        
        return suc;
    } else {
        return YES;
    }
}


@end
