//
//  UIView+zhLoading.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/12.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol zhLoadingDelegate <NSObject>

@optional
//是否展示loading页面
- (BOOL)zh_loadingViewShouldDisplay:(UIView *)view;

- (void)zh_loadingViewAgainReloadData:(UIView *)view;

@end

@interface UIView (zhLoading)

@property (nonatomic, weak) id<zhLoadingDelegate> loadingDelegate;

- (void)zh_startLoading;
- (void)zh_stopLoading;
- (void)zh_loadFailerWith:(nullable NSString *)title tapBlock:(nullable void(^)(void))responseHanlder;


@end

NS_ASSUME_NONNULL_END
