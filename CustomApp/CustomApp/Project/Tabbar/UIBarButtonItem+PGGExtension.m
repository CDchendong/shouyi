//
//  UIBarButtonItem+PGGExtension.m
//  PGG_Sina
//
//  Created by 陈鹏 on 2017/12/14.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import "UIBarButtonItem+PGGExtension.h"
#import "UIView+PGGExtension.h"

@implementation UIBarButtonItem (PGGExtension)
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image heighlightImage:(NSString *)heilightImage {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:heilightImage] forState:UIControlStateHighlighted];
    btn.size = CGSizeMake(44, 44);
    btn.imageEdgeInsets = UIEdgeInsetsMake(15, 0, 15, -10);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];    
}
@end
