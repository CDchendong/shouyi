//
//  UIButton+Category.h
//  Test
//
//  Created by eims on 17/6/20.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop = 0, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (Category)

/**
 设置button的titleLabel和imageView的布局样式，及间距
 @param style titleLabel和imageView的布局样式
 @param space titleLabel和imageView的间距
 */
- (void)ym_layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                           imageTitleSpace:(CGFloat)space;


/** 扩大button响应区域 */
- (void)ym_setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;


/** 启用倒计时（用于获取验证码） */
- (void)ym_startTimer;

/** 结束倒计时（用于获取验证码） */
- (void)ym_endTimer;

/** 点击按钮放大缩小动画（用于点赞） */
-(void)ym_animationBtnTransForm;

#pragma mark - 控件属性的扩展

/** 默认UIButton+边框 */
+ (UIButton *)ym_ButtonWithFrame:(CGRect)frame
                           title:(NSString *)title
                 backgroundColor:(UIColor *)backgroundColor
                      titleColor:(UIColor *)titleColor
                       titleSize:(CGFloat)titleSize
                   cornerRadius :(CGFloat)cornerRadius
                     borderWidth:(CGFloat)borderWidth
                     borderColor:(UIColor *)borderColor;

/** 默认UIButton */
+ (UIButton *)ym_ButtonWithFrame:(CGRect)frame
                           title:(NSString *)title
                 backgroundColor:(UIColor *)backgroundColor
                      titleColor:(UIColor *)titleColor
                       titleSize:(CGFloat)titleSize ;


@end
