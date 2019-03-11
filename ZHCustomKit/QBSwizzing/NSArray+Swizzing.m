//
//  NSArray+Swizzing.m
//  AppFactory
//
//  Created by 李佳宏 on 2017/5/10.
//  Copyright © 2017年 sobeycloud. All rights reserved.
//

#import "NSArray+Swizzing.h"
#import <objc/runtime.h>
@implementation NSArray (Swizzing)

+ (void)initialize {
    
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSArrayI");
        //When swizzling a class method, use the following:
        //Class class = object_getClass((id)self);
        
        NSArray *originalArray = @[@"objectAtIndex:"];
        NSArray *swizzledArray = @[@"qb_objectAtIndex:"];
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

- (void)setCheckIsNullObj:(BOOL)isCheck
{
    objc_setAssociatedObject(self, @selector(setCheckIsNullObj:), @(isCheck), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)qb_objectAtIndex:(NSUInteger)index{
    id value = [self qb_objectAtIndex:index];
    BOOL isCheckNull = [objc_getAssociatedObject(self, @selector(setCheckIsNullObj:)) boolValue];
    if ([value isKindOfClass:[NSNull class]] && isCheckNull) {
        return nil;
    }
    return value;
}
@end
