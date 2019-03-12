//
//  UIViewController+qbExtension.h
//  Basic_Category
//
//  Created by sobeycloud on 2018/12/19.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (qbExtension)



/**
 调用系统的 alert ,仅仅有提示能力
 
 @param title 标题
 @param message 描述
 */
- (void)qb_showAlertWithTitle:(NSString *)title withMessage:(NSString *)message;

/**
 调用系统的 alert .默认取消和确认按钮,而且只会回调确认事件
 
 @param title 标题
 @param message 描述
 @param handler 回调
 */
- (void)qb_showAlertWithTitle:(NSString *)title withMessage:(NSString *)message handler:(void (^)(UIAlertAction *action))handler;

/**
 调用系统的 alert .自定义标题和回调
 
 使用方法：
 [self qb_showAlertViewWithTitle:@"登录成功！" withMessage:@"是否启用指纹登录" cancelIndex:-1 withTextList:@[@"手势密码",@"启用指纹"] withHandlerList:@[
 ^(UIAlertAction * _Nonnull action) { // action_one },
 ^(UIAlertAction * _Nonnull action) { // action_two }
 ]];
 
 @param title 标题
 @param message 描述
 @param cancelIndex 取消按钮的位置，（取消位置要和 textList 的取消对应）
 @param textList 按钮标题文本信息
 @param handlerList 点击回调事件
 */
- (void)qb_showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message cancelIndex:(NSInteger)cancelIndex withTextList:(NSArray<NSString *> *)textList withHandlerList:(NSArray<void (^)(UIAlertAction *action)> *)handlerList;

/**
 调用系统的 actionSheet
 
 @param title 标题
 @param message 描述
 @param cancelIndex 取消按钮的位置，
 @param textList 按钮标题文本信息
 @param handlerList 点击回调事件
 */
- (void)qb_showActionSheetWithTitle:(NSString *)title withMessage:(NSString *)message cancelIndex:(NSInteger)cancelIndex withTextList:(NSArray<NSString *> *)textList withHandlerList:(NSArray<void (^)(UIAlertAction *action)> *)handlerList;






@end
