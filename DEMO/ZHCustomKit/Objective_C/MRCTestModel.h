//
//  MRCTestModel.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/17.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MRCTestModel : NSObject
{
    NSInteger _value;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSDictionary *parma;
@property (nonatomic, copy) NSArray *array;
@property (nonatomic, copy) NSNumber *num;

- (void)mrcTest;

@end

NS_ASSUME_NONNULL_END
