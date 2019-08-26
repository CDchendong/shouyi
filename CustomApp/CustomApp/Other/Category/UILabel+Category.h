//
//  UILabel+Category.h
//  Test
//
//  Created by eims on 17/6/21.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)
#pragma mark - 控件属性的扩展

/** 默认UILabel */
+ (instancetype)ym_labelWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor;

/** 默认UILabel+对齐方式 */
+ (instancetype)ym_labelWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;

/** 默认UILabel+对齐方式+边框 */
+ (instancetype)ym_labelWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius;

/** 设置富文本字体颜色 */
+ (void)setAttributeFontSize:(CGFloat)fontSize
                       Color:(UIColor*)color
            attributedString:(NSMutableAttributedString*)attributedString
                      string:(NSString *)string
               rangeOfString:(NSString *)str;

/** 设置富文本字体行距和段距 **/
+ (void)setAttributeLineSpacing:(CGFloat)lineSpacing
               paragraphSpacing:(CGFloat)paragraphSpacing
               attributedString:(NSMutableAttributedString*)attributedString
                         string:(NSString *)string
                  rangeOfString:(NSString *)str;

/**
 获取UILabel中文字的行数
 
 */

- (NSInteger )getTextLineCount;


@end
