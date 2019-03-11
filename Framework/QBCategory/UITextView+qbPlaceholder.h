//
//  UITextView+qbPlaceholder.h
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/21.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 定义一个UITextView 的站位文本。
@interface UITextView (qbPlaceholder)

- (void)setPlaceholder:(NSString *)placeholder;

/// 该方法的字体大小是不生效的
- (void)setAttPlaceholder:(NSAttributedString *)attPlaceholder;


@end
