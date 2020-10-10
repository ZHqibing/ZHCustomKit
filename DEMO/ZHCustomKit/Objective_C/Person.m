//
//  Person.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/14.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation Person


- (void) func {
    
    
//    class_getInstanceMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>)
    
    
    
    /**
     KVO 能实现的条件，
      1、动态创建对象
     
      2、必须要有setter 方法
     
      3、消息转发
     
     */
    
    // runtime 使用 Associated 关联对象
//    objc_setAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>, <#id  _Nullable value#>, <#objc_AssociationPolicy policy#>)
    
//    objc_getAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>)
    
    CFRunLoopRef;
    
    
    
    [[[self class] alloc] init];
    
}


+ (instancetype)allocWithName:(NSString *)mame {
    
    Person *p = [super alloc];
    if (p) {
        p.name = mame;
    }
    return p;
}


+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
//    NSAllocateO
    
    return [super allocWithZone:zone];
}


- (void)testFuncWithK:(NSString * __nullable)v1 kt:(NSArray * __nonnull)v2 kth:(NSDictionary *)v3 {
    NSLog(@"v1=%@; v2=%@; v3=%@",v1, v2, v3);
}




#pragma mark --- test

- (void)test {
    
    NSString *string = [NSString stringWithFormat:@"this is string"];
    NSLog(@"count = %ld",[string retainCount]);
    
    [self testString:string];
    
    
}

- (void)testString:(NSString *)string {
    
    string = [string stringByAppendingString:@";test string"];
    NSLog(@"string = %@; count = %ld",string, [string retainCount]);
    
    
}



#pragma mark --- 消息转发  第一步
+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@"resolveClassMethod:");
    if ([NSStringFromSelector(sel) isEqualToString:@""]) {
        
        
    }
    
    BOOL res = [super resolveClassMethod:sel];
    return res;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"resolveInstanceMethod:");
    if ([NSStringFromSelector(sel) isEqualToString:@""]) {
        
        class_addMethod(object_getClass(self), sel, (IMP)dynamicAddInstanceMethod, "v@:");
        
    }
    
    BOOL res = [super resolveClassMethod:sel];
    return res;
}

void dynamicAddInstanceMethod (id cls, id parma) {
    
    NSLog(@"动态注册了一个方法。。。");
    
}


#pragma mark ---- 第二步

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector:");
    
    id v = [super forwardingTargetForSelector:aSelector];
    return v;
}



#pragma mark --- 第三步:消息重定向
/// 如果消息到这里，runtime 会将消息封装成一个 NSInvocation ,
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation:");
    ///如果这里都无法处理，那么会向上调用父类看看能不能实现
    
    [super forwardInvocation:anInvocation];
}



#pragma mark ---- 消息转发失败了，就会调用这个方法
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    
    NSLog(@"这里就会抛出异常：unrecognized selector sent to instance ");
    
}


@end
