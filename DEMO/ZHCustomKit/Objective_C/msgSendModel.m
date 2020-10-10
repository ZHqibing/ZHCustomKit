//
//  msgSendModel.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/17.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "msgSendModel.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <objc/objc.h>

@implementation msgSendModel


- (void)objcSengAction {
    
    [self createInstanceMsg];
    
//    class_addProperty(<#Class  _Nullable __unsafe_unretained cls#>, <#const char * _Nonnull name#>, <#const objc_property_attribute_t * _Nullable attributes#>, <#unsigned int attributeCount#>)

    
    
    
}

- (void)createInstanceMsg {
    
    NSString *str = objc_msgSend([NSString class], @selector(alloc));
    str = objc_msgSend(str, @selector(init));
    str = objc_msgSend(str, @selector(stringByAppendingString:), @"hello");
    
    if (str) {

    }
    
}

- (void)msgSendErrorAction {
    
    id value = @(90);
    /// 编译期成功，运行期失败。
    [value stringByAppendingString:@"test"];
    
    
    id arr = @[@"v1"];
    [arr addObject:@"v2"];
    [arr setObject:@"value3" forKey:@"key3"];
    
    
    
}


- (void)dynamicAddMethod {
    
//    objc_getClass(<#const char * _Nonnull name#>)
    
    SEL sel = NSSelectorFromString(@"funcAdd");
    IMP imp = class_getMethodImplementation(self.class, sel);
    BOOL suc = class_addMethod(self.class, sel, imp, "@@:@");
    if (suc) {
        
    }
    
    
    id res = funcAdd(self, sel, @"hello Objective-C");
    if (res) {
        
    }
    
    
    
}

id funcAdd(id v, SEL sel,id v2){
    
    return v2;
}




- (void)msgSendTest {
    
    SEL sel = @selector(msgSentAction:v2:);
    
//    objc_msgSend(<#id  _Nullable self#>, <#SEL  _Nonnull op, ...#>)
    NSString *res = objc_msgSend(self, @selector(msgSentAction:v2:), @"大家好",@"我叫vae");
    
    
//    objc_msgSend()
    NSString *res1 = ((id (*)(id, SEL,id, id))objc_msgSend)(self, @selector(msgSentAction:v2:), @"大家好",@"我叫vae");
    
    id res2 = ((id (*)(id ,SEL, id, id))objc_msgSend)(self, @selector(msgSentAction:v2:),@"大家好",@" 我叫vae");
    
    IMP imp= class_getMethodImplementation(self.class, sel);
    NSString* (*func)(id,SEL,...) = (void *)imp;
    NSString *result = func(self,sel,@"hell", @" Objective-C");
    
    if (result) {
        
    }
    
}
- (NSString *)msgSentAction:(NSString *)v1 v2:(NSString *)v2{
    
    if (v2) {
        v1 = [v1 stringByAppendingString:v2];
    }
    return v1;
}



#pragma mark ---- 消息转发
//+ (NSString *)objcMsgForwardAction:(NSString *)value {
//    return @"你说的呀";
//}
//- (NSString *)objcMsgForwardAction:(NSString *)value {
//    return @"你说的呀";
//}

- (void)objcMsgForwardTest {
    
    SEL sel = NSSelectorFromString(@"objcMsgForwardAction:");
    id result = objc_msgSend(self, sel, @"hahahha");
    if (result) {
        
    }
    
//    objc_msgSendSuper(<#struct objc_super * _Nonnull super#>, <#SEL  _Nonnull op, ...#>)
    
}

///
+ (BOOL)resolveClassMethod:(SEL)sel {
    
    BOOL res = [super resolveClassMethod:sel];
    
    return res;
}
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    //允许用户动态为该类添加方法；
    //如果实现了，则返回YES，并且重新调用 objc_msgSend
    //如果没实现，则继续下面的操作。。
    // 这里代表着已经实现了 class_addMethod
//    class_addMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
    
    BOOL res = [super resolveInstanceMethod:sel];
    
    return res;
}


- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    //尝试找到一个能响应该消息的对象，如果找到，就将消息转发给该对象，返回一个不为空值。
    //如果找不到这样的对象，那么返回nil
    //这里不能用self，否则会形成私循环
    
    id res = [super forwardingTargetForSelector:aSelector];
    
    return res;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {

    //获得一个方法签名；如果获取不到，则调用 doesNotRecognizeSelector: 方法
    //如果获取到了，返回非nil，并创建一个 NSInvocation 给 forwardInvocation；
    NSMethodSignature *sign = [super methodSignatureForSelector:aSelector];
    
    NSMethodSignature *sig =[NSMethodSignature signatureWithObjCTypes:"v@:@"];
    
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    // 获取到上面的方法签名包装成 NSInvocation ，并具体处理
    
    NSLog(@"");
}


- (void)doesNotRecognizeSelector:(SEL)aSelector {
    
    NSLog(@"");
}



@end
