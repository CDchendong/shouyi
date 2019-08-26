//
//  UIImageView+Category.m
//  Test
//
//  Created by eims on 17/6/20.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "UIImageView+Category.h"
#import "UIImageView+YMWebCache.h"

@implementation UIImageView (Category)

/**
 图片播放效果动画 图片循环
 */
- (void)ym_pictureChangeAnimationSetting:(NSArray *)picArray {
    
    //imageView的动画图片是数组images
    self.animationImages = picArray;
    //按照原始比例缩放图片，保持纵横比
    self.contentMode = UIViewContentModeScaleAspectFit;
    //切换动作的时间3秒，来控制图像显示的速度有多快，
    self.animationDuration = 1;
    //动画的重复次数，想让它无限循环就赋成0
    self.animationRepeatCount = 0;
    
}

/**
 改变图片的大小
 */
- (void)ym_initImageSize:(CGSize)imgSize {
    
    CGSize itemSize = imgSize;
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [self.image drawInRect:imageRect];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

+ (instancetype)ym_imageViewWithFrame:(CGRect)frame UIImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius {

    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame               = frame;
    //图片切成圆角
    imageView.layer.cornerRadius  = cornerRadius;
    //遮罩后面的图片
    imageView.layer.masksToBounds = YES;
    //加入视图里面
    imageView.contentMode         = UIViewContentModeScaleAspectFill;

    return imageView;
}

#define YM_SETUI(x,y)                   \
WEAKSELF;                       \
return ^(x) {                   \
y;                              \
return weakSelf;                \
}

- (YMImageViewFrame)ym_frame {
    YM_SETUI(CGRect frame, weakSelf.frame = frame);
}

- (YMImageViewBackGroundColor)ym_backGroundColor {
    YM_SETUI(UIColor *color, weakSelf.backgroundColor = color);
}

- (YMImageViewTag)ym_tag {
    YM_SETUI(NSInteger tag, weakSelf.tag = tag);
}

- (YMImageViewBorderColor)ym_borderColor {
    YM_SETUI(UIColor *borderColor, weakSelf.layer.borderColor = borderColor.CGColor);
}

- (YMImageViewBorderWidth)ym_borderWidth {
    YM_SETUI(CGFloat borderWidth, weakSelf.layer.borderWidth = borderWidth);
}

- (YMImageViewCornerRadius)ym_cornerRadius {
    YM_SETUI(CGFloat cornerRadius, weakSelf.clipsToBounds = YES; weakSelf.layer.cornerRadius = cornerRadius);
}

- (YMImageViewContentMode)ym_contentMode {
    YM_SETUI(UIViewContentMode mode, weakSelf.contentMode = mode);
}

- (YMImage)ym_image {
    WEAKSELF;
    return ^(NSString * url,UIImage * placeholderImage){
        [weakSelf ym_setImageWithURL:url placeholderImage:placeholderImage];
        return weakSelf;
    };
}

- (YMLocalImage)ym_localImage {
    WEAKSELF;
    return ^(UIImage  * image){
        weakSelf.image = image;
        return weakSelf;
    };
}

@end
