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

- (void)pzShowAlertWithTitle:(NSString *)title withMessage:(NSString *)message {
    
    [self pzShowAlertViewWithTitle:title withMessage:message isAlert:YES cancelIndex:1 withTextList:@[@"确定"] withHandlerList:nil withStyleList:nil];
}

- (void)pzShowAlertWithTitle:(NSString *)title withMessage:(NSString *)message handler:(void (^)(UIAlertAction *))handler{
    
    [self pzShowAlertViewWithTitle:title withMessage:message isAlert:YES cancelIndex:1 withTextList:@[@"确定",@"取消"] withHandlerList:@[handler,^(UIAlertAction *action){}] withStyleList:nil];
}

- (void)pzShowAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message cancelIndex:(NSInteger)cancelIndex withTextList:(NSArray<NSString *> *)textList withHandlerList:(NSArray<void (^)(UIAlertAction *)> *)handlerList{
    
    [self pzShowAlertViewWithTitle:title withMessage:message isAlert:YES cancelIndex:cancelIndex withTextList:textList withHandlerList:handlerList withStyleList:nil];
}

- (void)pzShowActionSheetWithTitle:(NSString *)title withMessage:(NSString *)message cancelIndex:(NSInteger)cancelIndex withTextList:(NSArray<NSString *> *)textList withHandlerList:(NSArray<void (^)(UIAlertAction *)> *)handlerList {
    
    [self pzShowAlertViewWithTitle:title withMessage:message isAlert:NO cancelIndex:cancelIndex withTextList:textList withHandlerList:handlerList withStyleList:nil];
}

- (void)pzShowAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message isAlert:(BOOL)isAlert cancelIndex:(NSInteger)cancelIndex withTextList:(NSArray<NSString *> *)textList withHandlerList:(NSArray<void (^)(UIAlertAction *)> *)handlerList withStyleList:(NSArray *)styleList{
    
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
