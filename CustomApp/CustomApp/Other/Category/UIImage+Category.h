//
//  UIImage+Category.h
//  Test
//
//  Created by eims on 17/6/19.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

#pragma mark - 图片的操作-加载，拉伸-方法缩小等

/**
 根据图片名返回一张能够自由拉伸的图片  可以用于背景图保证图片不拉伸
 */
+ (UIImage *)ym_resizedImage:(NSString *)name;

/**
 根据拼接根路径及图片名加载图片
 */
+ (UIImage *)ym_imageWithRootPath:(NSString *)rootPath withPath:(NSString *)path;

/**
 压缩图片宽高
 */
- (UIImage*)ym_imageByScalingAndCroppingForSize:(CGSize)targetSize;

/**
 缩放图片
 */
- (UIImage *)ym_scaleToSize:(CGSize)size;

/**
 将图片等比例发大或缩小
 */
+ (UIImage *)ym_changeImageSize:(UIImage *)img scale:(CGFloat)scale;

/**
 压缩图片为指定尺寸
 */
+ (UIImage *)ym_scaleToSize:(UIImage *)img size:(CGSize)size;

/**
 UIColor转UIImage
 */
+ (UIImage *)ym_imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark - 裁剪图片

/**
 截取部分图像
 */
- (UIImage*)ym_getSubImage:(CGRect)rect;

/**
 截取正方形图像
 */
+ (UIImage *)ym_squareImageFromImage:(UIImage *)image;

/**
 根据图片名返回一张裁减后的圆形图片
 */
+ (instancetype)ym_imageWithRootPath:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

#pragma mark - Base64格式转换

/**
 base64Str转图片
 */
+ (UIImage *)ym_imageByBase64Str:(NSString *)base64Str;

/**
 图片转base64Str
 */
- (NSString *)ym_base64String;


- (NSData *)ym_compressQualityWithMaxLength:(NSInteger)maxLength;

@end
