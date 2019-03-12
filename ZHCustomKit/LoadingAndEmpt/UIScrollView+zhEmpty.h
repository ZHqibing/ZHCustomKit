//
//  UIScrollView+zhEmpty.h
//  ZHCustomKit
//
//  Created by sobeycloud on 2019/3/12.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, EmptyTypes) {
    EmptyTypes_text,
    EmptyTypes_image,
    EmptyTypes_textAndImage,
    EmptyTypes_custom,
};


@protocol zhEmptyDelegate;
@interface UIScrollView (zhEmpty)

@property (nonatomic, weak) id<zhEmptyDelegate> emptyDelegate;

- (void)zh_showEmptyWithStyle:(EmptyTypes)type;

- (void)zh_hideEmptyView;

@end


@protocol zhEmptyDelegate <NSObject>

@optional
- (NSString *)displayEmptyWithText;
- (UIImage *)displayEmptyWithImage;
- (UIView *)displayEmptyCustomView;

@end

NS_ASSUME_NONNULL_END
