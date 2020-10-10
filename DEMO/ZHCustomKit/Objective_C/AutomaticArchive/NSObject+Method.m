//
//  NSObject+Method.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/19.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "NSObject+Method.h"

@implementation NSObject (Method)



- (void)classMethod {
    NSLog(@"classMethod");
}
+ (void)instanceMethod {
    NSLog(@"instanceMethod");
}

@end
