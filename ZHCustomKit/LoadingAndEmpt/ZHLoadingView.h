//
//  ZHLoadingView.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/12.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHLoadingView : UIView

- (void)zh_startAnimating;

- (void)zh_stopAnimating;

- (void)zh_setLoadingFailerWith:(nullable NSString *)title tapBlock:(void(^)(void))responseHanlder;

@end

NS_ASSUME_NONNULL_END
