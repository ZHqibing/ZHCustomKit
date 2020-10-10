//
//  MRCTestModel.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/17.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "MRCTestModel.h"


/// 该文件采用MRC 编译
@implementation MRCTestModel

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.name = @"name";
        self.parma = @{@"key":@"value"};
        self.array = @[@"value1",@"value2"];
        self.num = @(12);
        
    }
    return self;
}

- (void)mrcTest {
    
    NSString *string = [NSString stringWithFormat:@"hello"];
    string = [string stringByAppendingString:@" Objective-C"];
    NSLog(@"count = %ld",[string retainCount]);
    
    [string retain];
    NSLog(@"count = %ld",[string retainCount]);
    
    [string release];
    NSLog(@"count = %ld",[string retainCount]);
    
    if (string == nil) {
        
        NSLog(@"string 释放了");
    } else {
        
        [string release];
        
    }
    
    if (string == nil) {
        
         NSLog(@"string 释放了");
    } else {
        
//        NSLog(@"count = %ld",[string retainCount]);
    }
    
    
#pragma mark --- test
    
    _value = 2;
    self->_value = 12;
    
    
    
    return;
    
}

@end
