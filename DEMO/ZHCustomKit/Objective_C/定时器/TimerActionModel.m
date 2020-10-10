//
//  TimerActionModel.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/21.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "TimerActionModel.h"

@implementation TimerActionModel


- (void)timerRun:(NSTimer *)tm {
    
    self.time += 1;
    
    NSLog(@" 定时器设置： %ld",self.time);
    
}


- (void)dealloc {
    NSLog(@"TimerModel dealloc Ti%s",__func__);
}

@end
