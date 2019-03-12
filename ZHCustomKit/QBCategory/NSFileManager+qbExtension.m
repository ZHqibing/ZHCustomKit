//
//  NSFileManager+qbExtension.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/12.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "NSFileManager+qbExtension.h"

@implementation NSFileManager (qbExtension)


+ (NSString *)qb_getDocumentsDirectorie {
    
    NSString *homeDir = NSHomeDirectory();
    homeDir = [homeDir stringByAppendingPathComponent:@"Documents"];
    
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
    
    return docDir;
}
+ (NSString *)qb_getLibraryDirectorie {
    
    NSString *libDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) lastObject];
    
    return libDir;
}
+ (NSString *)qb_getCachesDirectorie {
    
    NSString *cachesDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) firstObject];
    
    return cachesDir;
}
+ (NSString *)qb_getPreferencesDirectorie {
    
    NSString *preDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    [preDir stringByAppendingPathComponent:@"Preferences"];
    
    return preDir;
}
+ (NSString *)qb_getTmpDirectorie {
    
    NSString *tmpDir =NSTemporaryDirectory();
    
    return tmpDir;
}

@end
