//
//  UIImage+qbExtension.h
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/21.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (qbExtension)

///
- (UIImage *)scaleImageWithSize:(CGSize)size;

/// 给图片加圆角（外圈添加）
- (UIImage *)circleImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/// 传入图片设置默认图
+ (UIImage *)placeholderImageWithImage:(UIImage *)image FromColor:(UIColor *)color size:(CGSize)size;

/// 文字转图片
+ (UIImage *)imageWithTitle:(NSString *)title FromColor:(UIColor *)color size:(CGSize)size font:(UIFont *)font;

/// 图片加图片或者文字水印
- (UIImage *)imageWithWaterMask:(UIImage *)mask imageRect:(CGRect)imageRect text:(NSAttributedString *)text textRect:(CGRect)textRect;

@end
