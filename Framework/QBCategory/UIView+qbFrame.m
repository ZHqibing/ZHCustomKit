//
//  UIView+qbFrame.m
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/21.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import "UIView+qbFrame.h"

@implementation UIView (qbFrame)


- (CGFloat)x {
    
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x {
    
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (CGFloat)y {
    
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y {
    
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

- (CGFloat)width {
    
    CGRect rect = self.frame;
    return rect.size.width;
}
- (void)setWidth:(CGFloat)width {
    
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)height {
    
    CGRect rect = self.frame;
    return rect.size.height;
}
- (void)setHeight:(CGFloat)height {
    
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (CGPoint)orgin {
    
    CGRect rect = self.frame;
    return rect.origin;
}
- (void)setOrgin:(CGPoint)orgin {
    
    CGRect rect = self.frame;
    rect.origin = orgin;
    self.frame = rect;
}

- (CGSize)size {
    
    CGRect rect = self.frame;
    return rect.size;
}
- (void)setSize:(CGSize)size {
    
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}


- (UIViewController *)viewController {
    
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
    
}

@end
