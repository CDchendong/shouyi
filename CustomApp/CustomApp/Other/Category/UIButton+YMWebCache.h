//
//  UIButton+YMWebCache.h
//  Commect
//
//  Created by cassfile on 2017/6/16.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YMWebCache)

/**
 加载图片
 
 @param url 地址
 @param state 状态
 */
- (void)ym_setImageWithURL:(nullable NSString *)url
                  forState:(UIControlState)state;

/**
 加载按钮的图片
 
 @param url 地址
 @param state 按钮的状态
 @param placeholder 默认图片
 */
- (void)ym_setImageWithURL:(nullable NSString *)url
                  forState:(UIControlState)state
          placeholderImage:(nullable UIImage *)placeholder;


/**
 加载背景图片

 @param url 地址
 @param state 状态
 */
- (void)ym_setBackgroundImageWithURL:(nullable NSString *)url
                            forState:(UIControlState)state;


/**
 加载按钮的背景图片

 @param url 地址
 @param state 按钮的状态
 @param placeholder 默认图片
 */
- (void)ym_setBackgroundImageWithURL:(nullable NSString *)url
                            forState:(UIControlState)state
                    placeholderImage:(nullable UIImage *)placeholder;


/**
 * 取消图片下载
 */
- (void)ym_cancelImageLoadForState:(UIControlState)state;

/**
 * 取消背景图片的下载
 */
- (void)ym_cancelBackgroundImageLoadForState:(UIControlState)state;

@end
