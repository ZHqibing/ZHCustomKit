//
//  Woman.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/17.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@protocol testDelegate <NSObject>
@optional
- (void)testAction:(NSString *)v;
@end

@interface Woman : Person

@property (nonatomic, copy) NSString *name;



@property (nonatomic, copy) NSString *key0;
@property (nonatomic, copy) NSNumber *key1;
@property (nonatomic, strong) NSMutableArray *key2;
@property (nonatomic, assign) NSInteger key3;
@property (nonatomic, assign) BOOL key4;
@property (nonatomic, weak) id<testDelegate> tDelegate;

@property (nonatomic, copy) void(^block)(NSString *v);

@property (nonatomic, copy, nonatomic) NSString *key6;
@property (nonatomic, copy, nonatomic, nonnull) NSString *key5;
@property (nonatomic, copy) NSString *__nullable key7;  /// 可以为空
@property (nonatomic, copy) NSString *__nonnull key8;   /// 不能为空
@property (nonatomic, strong) NSString *key9;
@property (nonatomic, weak) NSString *key10;

- (void)testFuncWithK:(NSString * __nullable)v1 kt:(NSArray * __nonnull)v2 kth:(NSDictionary *)v3;

+ (void)test;

@end

NS_ASSUME_NONNULL_END
