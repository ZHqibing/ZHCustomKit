//
//  ArchiveModel.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/19.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+qbAutoArchive.h"
#import "NSObject+Method.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArchiveModel : NSObject<NSCoding, NSCopying, NSMutableCopying>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, copy) NSNumber *idCard;
@property (nonatomic, assign) NSInteger age;

//@property (nonatomic, copy) NSInteger sex;

@end

NS_ASSUME_NONNULL_END
