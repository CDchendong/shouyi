//
//  UITextField+Category.h
//  Test
//
//  Created by eims on 17/6/21.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Category)

/** 默认textField */
+ (instancetype)ym_textFieldWithFrame:(CGRect)frame
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                                  tag:(NSInteger)tag;

/** 默认textField + 风格设置 + 背景颜色 */
+ (instancetype)ym_textFieldWithFrame:(CGRect)frame
                      backgroundColor:(UIColor *)backgroundColor
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                          borderStyle:(UITextBorderStyle)borderStyle
                                  tag:(NSInteger)tag;

/** 默认textField + 键盘样式 + 是否隐藏输入 */
+ (instancetype)ym_textFieldWithFrame:(CGRect)frame
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                         keyboardType:(UIKeyboardType)keyboardType
                      secureTextEntry:(BOOL)secureTextEntry

                                  tag:(NSInteger)tag;
/** 设置placeHolder字体颜色，字体大小 */
- (void)setPlaceHolderFont:(UIFont *)font placeHolderColor:(UIColor *)color;


@end
