//
//  NSDictionary+Swizzle.m
//  AppFactory
//
//  Created by sobeycloud on 16/4/12.
//  Copyright © 2016年 sobeycloud. All rights reserved.
//

#import "NSDictionary+Swizzle.h"
#import <objc/runtime.h>

@implementation NSDictionary (Swizzle)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSDictionaryI");
        //When swizzling a class method, use the following:
        //Class class = object_getClass((id)self);
        
        NSArray *originalArray = @[@"valueForKey:",@"objectForKey:"];
        NSArray *swizzledArray = @[@"qb_valueForKey:",@"qb_objectForKey:"];
        for (int i = 0; i < originalArray.count; i++) {
            SEL originalSelector = NSSelectorFromString(originalArray[i]);
            SEL swizzledSelector = NSSelectorFromString(swizzledArray[i]);
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (didAddMethod) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            }
            else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    });
}

- (id)qb_valueForKey:(NSString *)key {
    id value = [self qb_valueForKey:key];
    if ([value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}

- (id)qb_objectForKey:(id)aKey {
    id object = [self qb_objectForKey:aKey];
    if ([object isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return object;
}

@end
