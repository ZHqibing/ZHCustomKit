//
//  ZHEmptyView.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/12.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHEmptyView : UIView

- (void)showTextWithTitle:(NSString *)title;
- (void)showImageWithImage:(UIImage *)image;
- (void)showCustomWithView:(UIView *)cView;

@end

NS_ASSUME_NONNULL_END
