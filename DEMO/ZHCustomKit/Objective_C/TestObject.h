//
//  TestObject.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/11.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CustomProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestObject : NSObject<NSCoding, CustomProtocol>
{
    NSString *_aValue;
    NSString *_testValue;
    NSString *testValue;
}
- (void)setAValue:(NSString *)v;
- (NSString *)aValue;


@property (nonatomic, copy) void (^block)(void);

@property (nonatomic, weak) id<CustomProtocol> delegate;

- (void)loadDataWithComplete:(void (^)(void))hanlder;

- (void)testDelegate;


@property (nonatomic, assign, getter=isSelected) BOOL selected;
@property (nonatomic, assign, setter=setupCanAddAction:) BOOL canAdd;
@property (nonatomic, copy, readwrite) NSString *pppp;

@property (nonatomic, copy) NSArray *array;


- (void)setNameSpace:(NSString *)str;






@end

NS_ASSUME_NONNULL_END
