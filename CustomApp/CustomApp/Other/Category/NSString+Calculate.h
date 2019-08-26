//
//  NSString+Calculate.h
//  ZhongChao
//
//  Created by JuncyChen on 2019/5/19.
//  Copyright © 2019 Danke. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Calculate)

- (CGSize)stringSizeWithFont:(UIFont *)font;
- (CGSize)stringSizeWithFont:(UIFont *)font boundary:(CGSize)boundary;

- (CGFloat)stringLengthWithFont:(UIFont *)font;
- (CGFloat)stringLengthWithFont:(UIFont *)font boundary:(CGSize)boundary;

- (CGFloat)stringHeightWithFont:(UIFont *)font;
- (CGFloat)stringHeightWithFont:(UIFont *)font boundary:(CGSize)boundary;

@end

NS_ASSUME_NONNULL_END
