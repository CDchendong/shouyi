//
//  UIImageView+YMWebCache.h
//  Commect
//
//  Created by cassfile on 2017/6/16.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YMWebCache)


/**
 通过URL地址加载图片

 @param url <#url description#>
 */
- (void)ym_setImageWithURL:(nullable NSString *)url;


/**
 通过URL地址加载图片 未加载前显示默认图片

 @param url 地址
 @param placeholder 默认图片
 */
- (void)ym_setImageWithURL:(nullable NSString *)url
          placeholderImage:(nullable UIImage *)placeholder;




@end
