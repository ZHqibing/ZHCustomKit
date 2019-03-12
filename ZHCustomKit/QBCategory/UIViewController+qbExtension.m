//
//  UIViewController+qbExtension.m
//  Basic_Category
//
//  Created by sobeycloud on 2018/12/19.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import "UIViewController+qbExtension.h"

@implementation UIViewController (qbExtension)


#pragma mark --  showAlertView

- (void)qb_showAlertWithTitle:(NSString *)title withMessage:(NSString *)message {
    
    [self qb_showAlertViewWithTitle:title withMessage:message isAlert:YES cancelIndex:1 withTextList:@[@"确定"] withHandlerList:nil withStyleList:nil];
}

- (void)qb_showAlertWithTitle:(NSString *)title withMessage:(NSString *)message handler:(void (^)(UIAlertAction *))handler{
    
    [self qb_showAlertViewWithTitle:title withMessage:message isAlert:YES cancelIndex:1 withTextList:@[@"确定",@"取消"] withHandlerList:@[handler,^(UIAlertAction *action){}] withStyleList:nil];
}

- (void)qb_showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message cancelIndex:(NSInteger)cancelIndex withTextList:(NSArray<NSString *> *)textList withHandlerList:(NSArray<void (^)(UIAlertAction *)> *)handlerList{
    
    [self qb_showAlertViewWithTitle:title withMessage:message isAlert:YES cancelIndex:cancelIndex withTextList:textList withHandlerList:handlerList withStyleList:nil];
}

- (void)qb_showActionSheetWithTitle:(NSString *)title withMessage:(NSString *)message cancelIndex:(NSInteger)cancelIndex withTextList:(NSArray<NSString *> *)textList withHandlerList:(NSArray<void (^)(UIAlertAction *)> *)handlerList {
    
    [self qb_showAlertViewWithTitle:title withMessage:message isAlert:NO cancelIndex:cancelIndex withTextList:textList withHandlerList:handlerList withStyleList:nil];
}

- (void)qb_showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message isAlert:(BOOL)isAlert cancelIndex:(NSInteger)cancelIndex withTextList:(NSArray<NSString *> *)textList withHandlerList:(NSArray<void (^)(UIAlertAction *)> *)handlerList withStyleList:(NSArray *)styleList{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:isAlert?UIAlertControllerStyleAlert:UIAlertControllerStyleActionSheet];
    
    for (int i=0; i<textList.count; i++) {
        
        UIAlertAction *theAction = [UIAlertAction actionWithTitle:textList[i] style:(i == cancelIndex ? UIAlertActionStyleCancel : UIAlertActionStyleDefault) handler:handlerList[i]];
        
        if (i == cancelIndex) {
            UIColor *purple = [UIColor lightGrayColor];
            [theAction setValue:purple forKey:@"titleTextColor"];
        }
        [alertController addAction:theAction];
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}




@end
