//
//  UITextField+Category.m
//  Test
//
//  Created by eims on 17/6/21.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)

+ (instancetype)ym_textFieldWithFrame:(CGRect)frame
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                                  tag:(NSInteger)tag {
    
    UITextField *textField = [[UITextField alloc]init];
    
    textField.frame = frame;
    textField.clearsOnBeginEditing  = NO;
    
    if (placeholder)    textField.placeholder       = placeholder;
    if (font)           textField.font              = [UIFont systemFontOfSize:font];
    if (textColor)      textField.textColor         = textColor;
    if (textField)      textField.borderStyle       = UITextBorderStyleNone;
    if (tag)            textField.tag               = tag;
    
    return textField;
}

+ (instancetype)ym_textFieldWithFrame:(CGRect)frame
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                        keyboardType:(UIKeyboardType)keyboardType
                      secureTextEntry:(BOOL)secureTextEntry
                                  tag:(NSInteger)tag {
    
    UITextField *textField = [self ym_textFieldWithFrame:frame
                                             placeholder:placeholder
                                                    font:font
                                               textColor:textColor
                                                     tag:tag];
    
    textField.keyboardType = keyboardType;
    textField.secureTextEntry = secureTextEntry;
    
    return textField;
}

+ (instancetype)ym_textFieldWithFrame:(CGRect)frame
                      backgroundColor:(UIColor *)backgroundColor
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                          borderStyle:(UITextBorderStyle)borderStyle
                                  tag:(NSInteger)tag {

    UITextField *textField = [self ym_textFieldWithFrame:frame
                                             placeholder:placeholder
                                                    font:font
                                               textColor:textColor
                                                     tag:tag];
    
    if (backgroundColor) textField.backgroundColor = backgroundColor;
    textField.borderStyle = borderStyle;
    
    return textField;
}
- (void)setPlaceHolderFont:(UIFont *)font placeHolderColor:(UIColor *)color{
    [self setValue:font forKeyPath:@"_placeholderLabel.font"];
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
    
}


@end
