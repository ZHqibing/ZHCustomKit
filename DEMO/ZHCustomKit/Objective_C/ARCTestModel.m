//
//  ARCTestModel.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/17.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "ARCTestModel.h"
#import <objc/objc.h>
#import <objc/runtime.h>
#import <objc/message.h>


@implementation ARCTestModel


- (void)arcTest {
    
    SEL sel = @selector(testAction:);
    
//    objc_msgSend(self, sel, @"嘎哈哈哈");
//    
//    objc_msgSend(self, @selector(testAction:), @"valuessss", @[@"v1",@"v2"]);
    
    
}

- (void)testAction:(NSString *)name {
    
    NSLog(@"");
    
}

void testActionWith(id value1, id value2) {
    
    NSLog(@"%@ == %@",value1, value2);
}


@end
