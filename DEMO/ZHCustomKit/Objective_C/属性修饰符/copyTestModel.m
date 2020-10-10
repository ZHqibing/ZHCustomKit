//
//  copyTestModel.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/20.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "copyTestModel.h"

@implementation copyTestModel

- (id)copyWithZone:(NSZone *)zone {
    
    copyTestModel *md = [[[self class] alloc] init];
    return md;
}

@end
