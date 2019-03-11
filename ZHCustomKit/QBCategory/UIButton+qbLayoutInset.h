//
//  UIButton+qbLayoutInset.h
//  BasicKit
//
//  Created by sobeycloud on 2019/2/20.
//  Copyright © 2019年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, QBButtonEdgeInsetsStyle) {
    QBButtonEdgeInsetsStyleTop,     //图片在上方，标题在下方
    QBButtonEdgeInsetsStyleLeft,
    QBButtonEdgeInsetsStyleBottom,
    QBButtonEdgeInsetsStyleRight,
};

@interface UIButton (qbLayoutInset)



/**
  按照需要重新约束按钮的 图片与标题 的 位置和间距 问题

 @param style 位置关系
 @param space 间距问题
 */
- (void)layoutButtonWithEdgeInsetsStyle:(QBButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
