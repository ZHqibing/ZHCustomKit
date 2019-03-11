//
//  UITextView+qbPlaceholder.m
//  Basic_Category
//
//  Created by sobeycloud on 2018/11/21.
//  Copyright © 2018年 sobeycloud. All rights reserved.
//

#import "UITextView+qbPlaceholder.h"
#import <objc/runtime.h>

static const void *placeholderLabel_Key = @"qb_placeholderLabel_key";

@interface UITextView ()

@property (nonatomic, strong) UILabel *placeholderLB;


@end

@implementation UITextView (qbPlaceholder)

- (UILabel *)placeholderLB {
    
    UILabel *label = objc_getAssociatedObject(self, placeholderLabel_Key);
    if (!label) {
        label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        [self setPlaceholderLB:label];
    }
    
    return label;
}
- (void)setPlaceholderLB:(UILabel *)placeholderLB {
    
    objc_setAssociatedObject(self, placeholderLabel_Key, placeholderLB, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSString *)placeholder {
    
    return @"";
}
- (NSAttributedString *)attPlaceholder {
    
    return [[NSAttributedString alloc] initWithString:@""];
}

- (void)setPlaceholder:(NSString *)placeholder {
    
    UILabel *placeholderLabel = [self valueForKey:@"_placeholderLabel"];

    if (!placeholderLabel) {

        placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.font = self.font;
        placeholderLabel.textColor = [UIColor colorWithWhite:0.7 alpha:1];
        [self addSubview:placeholderLabel];
        [self setValue:placeholderLabel forKey:@"_placeholderLabel"];

    }
    placeholderLabel.hidden = NO;
    placeholderLabel.text = placeholder;
    
    placeholderLabel.userInteractionEnabled = NO;
    
}

- (void)setAttPlaceholder:(NSAttributedString *)attPlaceholder {
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithAttributedString:attPlaceholder];
    [attributeString addAttributes:@{NSFontAttributeName: self.font} range:NSMakeRange(0, attPlaceholder.length)];

    UILabel *placeholderLabel = [self valueForKey:@"_placeholderLabel"];
    
    if (!placeholderLabel) {
        
        placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.font = self.font;
        placeholderLabel.textColor = [UIColor colorWithWhite:0.7 alpha:1];
        [self addSubview:placeholderLabel];
        [self setValue:placeholderLabel forKey:@"_placeholderLabel"];
        
    }
    placeholderLabel.hidden = NO;
    placeholderLabel.attributedText = attributeString;
    
    placeholderLabel.userInteractionEnabled = NO;
    
}



@end
