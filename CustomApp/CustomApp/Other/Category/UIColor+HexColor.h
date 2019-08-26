//
//  UIColor+HexColor.h
//  ZhongChao
//
//  Created by JuncyChen on 2019/5/18.
//  Copyright © 2019 Danke. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define COLOR_HEXS(value) [UIColor colorWithHexString:value]
#define COLOR_HEXSA(value, alpha) [[UIColor colorWithHexString:value] colorWithAlphaComponent:alpha]

@interface UIColor (HexColor)

/**
 十六进制字符串颜色
 
 @param hexString 十六进制字符串
 @return 颜色实例
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
