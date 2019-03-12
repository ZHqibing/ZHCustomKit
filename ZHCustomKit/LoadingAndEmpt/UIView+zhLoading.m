//
//  UIView+zhLoading.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/12.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "UIView+zhLoading.h"
#import <objc/runtime.h>
#import "ZHLoadingView.h"

static const void * const zhLoadingViewKey = @"zh_loadingview_key";
static const void * const zhLoadingViewDelegateKey = @"zh_loadingview_delegate_key";
static const void * const zhLoadingViewBlockKey = @"zh_loadingview_block_key";

@interface UIView ()

@property (nonatomic, strong) ZHLoadingView *loadingView;
@property (nonatomic, copy) void(^responseHanlder)(void);

@end


@implementation UIView (zhLoading)


- (void)zh_startLoading {
    
    if (self.loadingView == nil) {
        ZHLoadingView *vv = [[ZHLoadingView alloc] initWithFrame:self.bounds];
        [self setLoadingView:vv];
        self.loadingView = vv;
    }
    BOOL showLoading = YES;
    if ([self.loadingDelegate respondsToSelector:@selector(zh_loadingViewShouldDisplay:)]) {
        showLoading = [self.loadingDelegate zh_loadingViewShouldDisplay:self];
    }
    if (showLoading) {
        [self addSubview:self.loadingView];
    } else {
        [self.loadingView removeFromSuperview];
        self.loadingView = nil;
    }
    [self.loadingView zh_startAnimating];
    
}

- (void)zh_stopLoading {
    
    if (self.loadingView) {
        [self.loadingView zh_stopAnimating];
        [self.loadingView removeFromSuperview];
        self.loadingView = nil;
    }
    
}

- (void)zh_loadFailerWith:(NSString *)title tapBlock:(void (^)(void))responseHanlder{
    
    self.responseHanlder = responseHanlder;
    if (self.loadingView) {
        __weak typeof(self)ws = self;
        [self.loadingView zh_setLoadingFailerWith:title tapBlock:^{
            [ws zh_loadFailerAction];
        }];
    }
}


#pragma mark --- loadFailerAction

- (void)zh_loadFailerAction {
    
    [self.loadingView zh_startAnimating];
    
    /// 采取只有一个的d方式加载呢。。
    if (self.responseHanlder) {
        self.responseHanlder();
    }
    else if ([self.loadingDelegate respondsToSelector:@selector(zh_loadingViewAgainReloadData:)]) {
        [self.loadingDelegate zh_loadingViewAgainReloadData:self];
    }
    
}

#pragma mark --- setter/getter
- (void)setLoadingDelegate:(id<zhLoadingDelegate>)loadingDelegate {
    
    objc_setAssociatedObject(self, zhLoadingViewDelegateKey, loadingDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id<zhLoadingDelegate>)loadingDelegate {
    
    return objc_getAssociatedObject(self, zhLoadingViewDelegateKey);
}

- (void)setLoadingView:(ZHLoadingView *)loadingView {
    
    objc_setAssociatedObject(self, zhLoadingViewKey
                             , loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (ZHLoadingView *)loadingView {
    
    return objc_getAssociatedObject(self, zhLoadingViewKey);
}

- (void)setResponseHanlder:(void (^)(void))responseHanlder {
    
    objc_setAssociatedObject(self, zhLoadingViewBlockKey, responseHanlder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void (^)(void))responseHanlder {
    
    return objc_getAssociatedObject(self, zhLoadingViewBlockKey);
}

@end
