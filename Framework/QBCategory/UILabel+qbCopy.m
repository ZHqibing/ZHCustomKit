//
//  UILabel+qbCopy.m
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/21.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import "UILabel+qbCopy.h"
#import <objc/runtime.h>

@implementation UILabel (qbCopy)

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(copyText:) || action == @selector(pastText:));
}

- (void)attachTapHandler {
    NSString *textStr = nil;
    if (self.text) {
        textStr = self.text;
    } else {
        textStr = self.attributedText.string;
    }
    if (!(textStr.length > 0)) {//保证有才复制
        return;
    }
    
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *g = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:g];
}

//  处理手势相应事件
- (void)handleTap:(UIGestureRecognizer *)g {
    [self becomeFirstResponder];
    
    if ([[UIMenuController sharedMenuController] isMenuVisible]) {
        return;
    }
    
    [[UIMenuController sharedMenuController] update];
    UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyText:)];
    UIMenuItem *pastItem = [[UIMenuItem alloc] initWithTitle:@"粘贴" action:@selector(pastText:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyItem, pastItem, nil]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    
}

//  复制时执行的方法
- (void)copyText:(id)sender {
    //  通用的粘贴板
    UIPasteboard *pBoard = [UIPasteboard generalPasteboard];
    
    //  有些时候只想取UILabel的text中的一部分
    if (objc_getAssociatedObject(self, @"expectedText")) {
        pBoard.string = objc_getAssociatedObject(self, @"expectedText");
    } else {
        
        //  因为有时候 label 中设置的是attributedText
        //  而 UIPasteboard 的string只能接受 NSString 类型
        //  所以要做相应的判断
        if (self.text) {
            pBoard.string = self.text;
        } else {
            pBoard.string = self.attributedText.string;
        }
    }
}

- (void)pastText:(id)sender {
    //  通用的粘贴板
    UIPasteboard *pBoard = [UIPasteboard generalPasteboard];
    self.text = pBoard.string;
    
}

- (BOOL)canBecomeFirstResponder {
    return [objc_getAssociatedObject(self, @selector(isCopyable)) boolValue];
}

- (void)setIsCopyable:(BOOL)number {
    objc_setAssociatedObject(self, @selector(isCopyable), [NSNumber numberWithBool:number], OBJC_ASSOCIATION_ASSIGN);
    [self attachTapHandler];
}

- (BOOL)isCopyable {
    return [objc_getAssociatedObject(self, @selector(isCopyable)) boolValue];
}

@end
