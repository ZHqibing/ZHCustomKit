//
//  UIView+qbFrame.h
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/21.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (qbFrame)

@property (nonatomic, assign) CGFloat  x;
@property (nonatomic, assign) CGFloat  y;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGPoint orgin;
@property (nonatomic, assign) CGSize size;

@property (nonatomic, strong, readonly) UIViewController *viewController;

@end
