
//
//  ArchiveModel.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/19.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "ArchiveModel.h"
#import <objc/runtime.h>
#import <objc/objc.h>

@implementation ArchiveModel

@synthesize name = _name;

- (void)setName:(NSString *)name {
    _name = name;
}
- (NSString *)name {
    return _name;
}


#pragma mark ---- @protocol NSCopying

- (id)copyWithZone:(nullable NSZone *)zone {
    
    id obj = [[[self class] alloc] init];
    
    return obj;
    
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    
    id obj = [[[self class] alloc] init];
    
    return obj;
}



- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [self modelEncodeWithCoder:aCoder];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (self) {
        
        [self modelInitWithWithCode:aDecoder];
        
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
