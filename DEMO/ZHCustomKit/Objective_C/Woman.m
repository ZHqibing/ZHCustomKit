//
//  Woman.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/17.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "Woman.h"
#import <objc/runtime.h>
#import <objc/objc.h>

@implementation Woman

@synthesize name = _name;


- (instancetype)init {
    self = [super init];
    if (self) {
//        self.block = <#^(NSString * _Nonnull v)#>
        
        
        Class clas = self.class;
        Class cls = object_getClass(self);
        Class sup = class_getSuperclass(cls);
        Class supC = class_getSuperclass(self.class);
        
        
        NSLog(@"");
    }
    return self;
}

+ (void)test {
    
    Class clas = self.class;
    Class cls = object_getClass(self);
    Class sup = class_getSuperclass(cls);
    Class supC = class_getSuperclass(self.class);
    
    
    NSLog(@"");
    
}

#pragma mark ---- 消息转发
/// step1
+ (BOOL)resolveInstanceMethod:(SEL)sel {

    BOOL res = [super resolveInstanceMethod:sel];
    return res;
}


/// step2
- (id)forwardingTargetForSelector:(SEL)aSelector {

    id ff = [super forwardingTargetForSelector:aSelector];
    return ff;
}

/// step3
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    [super forwardInvocation:anInvocation];
    
}

/// step4
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    
    [super doesNotRecognizeSelector:aSelector];
    NSLog(@"山穷水尽");
}


@end
