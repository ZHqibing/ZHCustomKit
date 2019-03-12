//
//  UIScrollView+zhEmpty.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/12.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "UIScrollView+zhEmpty.h"
#import <objc/runtime.h>
#import "ZHEmptyView.h"


static const void *const emptyViewKey = @"zh_emptyview_key";


@interface UIScrollView ()

@property (nonatomic, strong) ZHEmptyView *emptyView;

@end

@implementation UIScrollView (zhEmpty)


- (void)zh_showEmptyWithStyle:(EmptyTypes)type {
    
    if (self.emptyView == nil) {
        ZHEmptyView *vv = [[ZHEmptyView alloc] initWithFrame:self.bounds];
        [self setEmptyView:vv];
        self.emptyView = vv;
    }
    
    switch (type) {
        case EmptyTypes_text:
        {
            NSString *title = @"暂无数据";
            if ([self.emptyDelegate respondsToSelector:@selector(displayEmptyWithText)]) {
                title = [self.emptyDelegate displayEmptyWithText];
            }
            [self.emptyView showTextWithTitle:title];
            
        }
            break;
        case EmptyTypes_image:
        {
            UIImage *img = nil;
            if ([self.emptyDelegate respondsToSelector:@selector(displayEmptyWithImage)]) {
                img = [self.emptyDelegate displayEmptyWithImage];
            }
            [self.emptyView showImageWithImage:img];
            
        }
            break;
        case EmptyTypes_textAndImage:
        {
            NSString *title = @"";
            if ([self.emptyDelegate respondsToSelector:@selector(displayEmptyWithText)]) {
                title = [self.emptyDelegate displayEmptyWithText];
            }
            [self.emptyView showTextWithTitle:title];
            
            UIImage *img = nil;
            if ([self.emptyDelegate respondsToSelector:@selector(displayEmptyWithImage)]) {
                img = [self.emptyDelegate displayEmptyWithImage];
            }
            [self.emptyView showImageWithImage:img];
        }
            break;
        case EmptyTypes_custom:
        {
            UIView *vi = nil;
            if ([self.emptyDelegate respondsToSelector:@selector(displayEmptyCustomView)]) {
                vi = [self.emptyDelegate displayEmptyCustomView];
            }
            [self.emptyView showCustomWithView:vi];
        }
            break;
        default:
            break;
    }
    
}

- (void)zh_hideEmptyView {
    
    if (self.emptyView) {
        [self.emptyView removeFromSuperview];
        self.emptyView = nil;
    }
}


#pragma mark --- setter/getter

- (void)setEmptyDelegate:(id<zhEmptyDelegate>)emptyDelegate {
    objc_setAssociatedObject(self, @selector(emptyDelegate), emptyDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id<zhEmptyDelegate>)emptyDelegate {
    
    return objc_getAssociatedObject(self, @selector(emptyDelegate));
}

- (void)setEmptyView:(ZHEmptyView *)emptyView {
    objc_setAssociatedObject(self, emptyViewKey, emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (ZHEmptyView *)emptyView {
    return objc_getAssociatedObject(self, emptyViewKey);
}

@end
