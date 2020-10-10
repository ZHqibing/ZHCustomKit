//
//  Person.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/14.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import "objc/objc.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    NSNumber *_age;
}
@property (nonatomic, copy) NSString *name;

+ (instancetype)allocWithName:(NSString *)mame;

- (void)test;


@end

NS_ASSUME_NONNULL_END
