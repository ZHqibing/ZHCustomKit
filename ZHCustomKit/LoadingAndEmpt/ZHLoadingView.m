//
//  ZHLoadingView.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/12.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "ZHLoadingView.h"

@interface ZHLoadingView ()

@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, strong) UILabel *tipsLB;

@property (nonatomic, copy) void(^responseBlock)(void);


@end

@implementation ZHLoadingView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
     
        self.activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        self.activityView.center = CGPointMake(CGRectGetWidth(frame)/2.0, CGRectGetHeight(frame)/2.0);
        self.activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [self addSubview:self.activityView];
        
        self.tipsLB = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame) - 40, 20)];
        self.tipsLB.center = CGPointMake(CGRectGetWidth(frame)/2.0, CGRectGetHeight(frame)/2.0);
        self.tipsLB.font = [UIFont systemFontOfSize:15];
        self.tipsLB.textColor = [UIColor colorWithWhite:0.5 alpha:1];
        [self addSubview:self.tipsLB];
        self.tipsLB.textAlignment = NSTextAlignmentCenter;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        self.tipsLB.userInteractionEnabled = YES;
        [self.tipsLB addGestureRecognizer:tap];
        
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        
    }
    return self;
}

- (void)zh_startAnimating {
    
    self.tipsLB.text = @"";
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    
}

- (void)zh_stopAnimating {
    
    [self.activityView stopAnimating];
}

- (void)zh_setLoadingFailerWith:(NSString *)title tapBlock:(void (^)(void))responseHanlder {
    
    self.responseBlock = responseHanlder;
    
    self.tipsLB.text = title.length > 0 ? title : @"加载失败，点击重试！";
    [self.activityView stopAnimating];
    self.activityView.hidden = YES;
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    
    if (self.responseBlock) {
        self.responseBlock();
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
