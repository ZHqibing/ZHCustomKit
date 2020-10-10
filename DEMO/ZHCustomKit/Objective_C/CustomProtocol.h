//
//  CustomProtocol.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/19.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CustomProtocol <NSObject>

@property (nonatomic, copy) NSString *pp1;
@property (nonatomic, assign) NSInteger pp2;

@optional
- (void)testProtocloAction:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
