//
//  CricleModelTestB.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/21.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CricleModelTestA;

NS_ASSUME_NONNULL_BEGIN

@interface CricleModelTestB : NSObject

//@property (nonatomic, strong) CricleModelTestA *modelTestA;

@property (nonatomic, weak) CricleModelTestA *modelTestA;

@end

NS_ASSUME_NONNULL_END
