//
//  ZHCustomCommon.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/11.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "ZHCustomCommon.h"
#import <sys/utsname.h>

@implementation ZHCustomCommon

static ZHCustomCommon *common;

+ (void)initialize {
    
    
    
}

- (instancetype)init {
    if (!common) {
        common = [super init];
    }
    return common;
}
+ (instancetype)shareCommon {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        common = [[ZHCustomCommon alloc] init];
    });
    return common;
}


- (BOOL)isIphoneX {
    
    static BOOL is_iphoneX = NO;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
        
        if ([platform isEqualToString:@"iPhone10,3"] || [platform isEqualToString:@"iPhone10,6"]) {
            is_iphoneX = YES;
        }
        if ([platform isEqualToString:@"iPhone11,8"]) {
            is_iphoneX = YES;
        }
        if ([platform isEqualToString:@"iPhone11,2"]) {
            is_iphoneX = YES;
        }
        if ([platform isEqualToString:@"iPhone11,6"]) {
            is_iphoneX = YES;
        }
        
    });
     
    return is_iphoneX;
}


@end
