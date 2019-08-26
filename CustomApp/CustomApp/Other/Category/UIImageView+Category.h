//
//  UIImageView+Category.h
//  Test
//
//  Created by eims on 17/6/20.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Category)

/** 图片播放效果动画 图片循环 */
- (void)ym_pictureChangeAnimationSetting:(NSArray *)picArray;

/** 改变图片的大小 */
- (void)ym_initImageSize:(CGSize)imgSize;

#pragma mark - 控件属性的扩展

+ (instancetype)ym_imageViewWithFrame:(CGRect)frame UIImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius;

typedef UIImageView * (^YMImageViewFrame)             (CGRect             frame);
typedef UIImageView * (^YMImageViewBackGroundColor)   (UIColor *          color);
typedef UIImageView * (^YMImageViewTag)               (NSInteger          tag);
typedef UIImageView * (^YMImageViewBorderWidth)       (CGFloat            borderWidth);
typedef UIImageView * (^YMImageViewBorderColor)       (UIColor            *borderColor);
typedef UIImageView * (^YMImageViewCornerRadius)      (CGFloat            radius);
typedef UIImageView * (^YMImageViewContentMode)       (UIViewContentMode  mode);
typedef UIImageView * (^YMImage)         (NSString  * url , UIImage * placeholderImage);
typedef UIImageView * (^YMLocalImage)    (UIImage  * image);

/** 位置大小 */
@property (nonatomic, copy , readonly)YMImageViewFrame ym_frame;
/** 背景颜色 */
@property (nonatomic, copy , readonly)YMImageViewBackGroundColor ym_backGroundColor;
/** 标识 */
@property (nonatomic, copy , readonly)YMImageViewTag ym_tag;
/** 边框宽度 */
@property (nonatomic, copy , readonly)YMImageViewBorderWidth ym_borderWidth;
/** 边框颜色 */
@property (nonatomic, copy , readonly)YMImageViewBorderColor ym_borderColor;
/** 设置圆角 */
@property (nonatomic, copy , readonly)YMImageViewCornerRadius ym_cornerRadius;
/** 视图布局显示 */
@property (nonatomic, copy , readonly)YMImageViewContentMode ym_contentMode;
/** 添加网络图片 */
@property (nonatomic, copy , readonly)YMImage ym_image;
/** 添加本地图片 */
@property (nonatomic, copy , readonly)YMLocalImage ym_localImage;

@end
