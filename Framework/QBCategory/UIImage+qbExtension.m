//
//  UIImage+qbExtension.m
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/21.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import "UIImage+qbExtension.h"

@implementation UIImage (qbExtension)

-(UIImage*) scaleImageWithSize:(CGSize)size
{
    
    UIGraphicsBeginImageContextWithOptions(size,NO,[UIScreen mainScreen].scale);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

- (UIImage *)circleImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 1.加载原图
    UIImage *oldImage = self;
    
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

//传入图片设置默认图
+ (UIImage *)placeholderImageWithImage:(UIImage *)image FromColor:(UIColor *)color size:(CGSize)size {
    
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    //渲染自身
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIColor *bgColor = color;
    CGContextSetStrokeColorWithColor(ctx, bgColor.CGColor);
    CGContextSetFillColorWithColor(ctx, bgColor.CGColor);
    CGRect bgRect = CGRectMake(0, 0, size.width, size.height);
    CGContextAddRect(ctx, bgRect);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    
    if (image) {
        
        CGFloat startX = size.width/2.0 - image.size.width/2.0;
        CGFloat startY = size.height/2.0 - image.size.height/2.0;
        
        [image drawAtPoint:CGPointMake(startX, startY)];
        
    }
    
    UIImage *uiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return uiImage;   //返回的就是已经改变的图片
    
}

+ (UIImage *)imageWithTitle:(NSString *)title FromColor:(UIColor *)color size:(CGSize)size font:(UIFont *)font{
    
    
    if (!title || [title isEqualToString:@""]) {
        
        title = @"青";
        
    }
    
    title = [title substringWithRange:NSMakeRange(0,1)];
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    //渲染自身
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    NSMutableParagraphStyle* style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:NSTextAlignmentCenter];
    
    NSDictionary *attributes = @{NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:color,
                                 NSParagraphStyleAttributeName:style
                                 
                                 };
    
    [title drawInRect:CGRectMake(0, size.height/2.0 - font.pointSize/2.0, size.width, size.height) withAttributes:attributes];
    
    CGContextSetFillColorWithColor(ctx, [UIColor clearColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx,[[UIColor blackColor] CGColor]);
    CGContextSetLineWidth(ctx, 1.0);
    CGContextAddArc(ctx, size.width/2.0, size.height/2.0, size.width/2.0, 0, 2*M_PI, 0); //添加一个圆
    
    
    CGContextDrawPath(ctx, kCGPathFillStroke); //绘制路径加填充
    UIImage *uiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return uiImage;   //返回的就是已经改变的图片
    //
}


- (UIImage *)imageWithWaterMask:(UIImage *)mask imageRect:(CGRect)imageRect text:(NSAttributedString *)text textRect:(CGRect)textRect
{
    
    UIGraphicsBeginImageContextWithOptions([self size], NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    
    //原图
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //水印图
    [mask drawInRect:imageRect];
    [text drawInRect:textRect];
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newPic;
    
}

@end
