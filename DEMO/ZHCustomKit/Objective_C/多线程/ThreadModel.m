//
//  ThreadModel.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/19.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "ThreadModel.h"


@interface ThreadModel ()

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSLock *lock;


@end


@implementation ThreadModel


#pragma mark --- 线程锁
- (void)lockTestAction {
    
    _count = 50;
    self.lock = [[NSLock alloc] init];
    while (_count > 0) {
        
        NSThread *th = [[NSThread alloc] initWithTarget:self selector:@selector(countTestAction) object:nil];
//        NSThread *th = [[NSThread alloc] init];
        [th start];
        if ([th isFinished]) {
            /// 这里在调用 th 已经释放了
//            [self performSelector:@selector(countTestAction) onThread:th withObject:@"" waitUntilDone:NO];
        }
        
    }
    
    
}
- (void)countTestAction {
    
    sleep(1);
    
    NSString *str = @"";
    @synchronized (self) {
        
        if (_count > 0) {
            _count -= 1;
            str = @"需要执行指定事件";
        }
    }
    NSLog(@"当前Thread = %@; count = %ld；%@",[NSThread currentThread],_count, str);
    
    
//    /// NSLock 实现同步锁
//    [self.lock lock];
//    if (self.count > 0) {
//        self.count -= 1;
//        
//        NSLog(@"self.count = %ld",self.count);
//    }
//    [self.lock unlock];

    
//    /// 使用 @synchronized 实现同步锁
//    @synchronized (self) {
//        if (self.count > 0) {
//            self.count -= 1;
//
//            NSLog(@"self.count = %ld",self.count);
//        }
//    }

    
}



@end
