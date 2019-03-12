//
//  ZHEmptyView.m
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/12.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import "ZHEmptyView.h"


@interface ZHEmptyView ()

@property (nonatomic, strong) UILabel *emptyLB;
@property (nonatomic, strong) UIImageView *emptyImg;

@end
@implementation ZHEmptyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        
        self.emptyLB = [[UILabel alloc] init];
        self.emptyLB.textColor = [UIColor colorWithWhite:0.5 alpha:1];
        self.emptyLB.textAlignment = NSTextAlignmentCenter;
        self.emptyLB.font = [UIFont systemFontOfSize:14];
        
        self.emptyImg = [[UIImageView alloc] init];
        
    }
    return self;
}


- (void)showTextWithTitle:(NSString *)title {
    if (title.length > 0) {
        self.emptyLB.text = title;
    }
}
- (void)showImageWithImage:(UIImage *)image {
    if (image) {
        self.emptyImg.image = image;
    }
}
- (void)showCustomWithView:(UIView *)cView {
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
