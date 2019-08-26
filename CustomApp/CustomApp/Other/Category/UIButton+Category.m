//
//  UIButton+Category.m
//  Test
//
//  Created by eims on 17/6/20.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "UIButton+Category.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
#import "UIButton+YMWebCache.h"

@interface UIButton ()
@property (nonatomic,strong)NSTimer   *timer;
@property (nonatomic,assign)NSInteger count;
@end

@implementation UIButton (Category)
static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;
static void *timerKey;
static char countKey;

// 设置button的titleLabel和imageView的布局样式，及间距
- (void)ym_layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                           imageTitleSpace:(CGFloat)space {
    /**
     * 知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     * 如果只有title，那它上下左右都是相对于button的，image也是一样；
     * 如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    /**
     MKButtonEdgeInsetsStyleTop, // image在上，label在下
     MKButtonEdgeInsetsStyleLeft, // image在左，label在右
     MKButtonEdgeInsetsStyleBottom, // image在下，label在上
     MKButtonEdgeInsetsStyleRight // image在右，label在左
     */
    switch (style) {
        case MKButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case MKButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}
// 扩大btn响应区域
- (void)ym_setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left {
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark 倒数时间效果

- (void)setTimer:(NSTimer *)timer {
    
    objc_setAssociatedObject(self, &timerKey, timer, OBJC_ASSOCIATION_RETAIN);
}

- (NSTimer *)timer {
    return objc_getAssociatedObject(self, &timerKey);
}

- (void)setCount:(NSInteger)count {
    
    objc_setAssociatedObject(self, &countKey, [NSNumber numberWithFloat:count], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSInteger)count {
    
    NSNumber* topEdge = objc_getAssociatedObject(self, &countKey);
    return topEdge.integerValue;
}

// 启用倒计时（用于获取验证码）
- (void)ym_startTimer {
    
    self.count = 60;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(startMinu) userInfo:nil repeats:YES];
}

// 结束倒计时（用于获取验证码）
- (void)ym_endTimer {
    
    [self setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.enabled = YES;
    [self.timer invalidate];
    self.timer = nil;
}

- (void)startMinu {
    
    self.count--;
    if (self.count > 0) {
        
        [self setTitle:[NSString stringWithFormat:@"%d秒后重发",(int)self.count] forState:UIControlStateNormal];
        
        self.enabled = NO;
    }else {
        [self setTitle:@"重新发送" forState:UIControlStateNormal];
        self.enabled = YES;
        [self.timer invalidate];
        self.timer = nil;
    }
}

// 点击按钮放大缩小动画（用于点赞）
- (void)ym_animationBtnTransForm{
    
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0 animations: ^{
            
            self.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations: ^{
            
            self.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations: ^{
            
            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:nil];
}

+ (UIButton *)ym_ButtonWithFrame:(CGRect)frame
                              title:(NSString *)title
                    backgroundColor:(UIColor *)backgroundColor
                         titleColor:(UIColor *)titleColor
                          titleSize:(CGFloat)titleSize
                       cornerRadius:(CGFloat)cornerRadius
                        borderWidth:(CGFloat)borderWidth
                        borderColor:(UIColor *)borderColor {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame              = frame;
    
    if (backgroundColor)    button.backgroundColor  = backgroundColor;
    
    if (title)              [button setTitle:title forState:UIControlStateNormal];
    
    if (titleSize)          button.titleLabel.font = [UIFont systemFontOfSize:titleSize];
    
    if (titleColor)         [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (borderWidth)        button.layer.borderWidth = borderWidth;
    
    if (borderColor)        button.layer.borderColor = borderColor.CGColor;
    
    if (cornerRadius) {
        
        button.layer.cornerRadius = cornerRadius;
        
        button.layer.masksToBounds = YES;
    };
    
    
    return button;
    
    
}

+ (UIButton *)ym_ButtonWithFrame:(CGRect)frame
                              title:(NSString *)title
                    backgroundColor:(UIColor *)backgroundColor
                         titleColor:( UIColor *)titleColor
                          titleSize:(CGFloat)titleSize {
    
    return [self ym_ButtonWithFrame:frame title:title backgroundColor:backgroundColor titleColor:titleColor titleSize:titleSize cornerRadius:0 borderWidth:0 borderColor:nil];
    
}


@end
