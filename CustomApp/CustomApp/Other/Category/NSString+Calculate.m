//
//  NSString+Calculate.m
//  ZhongChao
//
//  Created by JuncyChen on 2019/5/19.
//  Copyright © 2019 Danke. All rights reserved.
//

#import "NSString+Calculate.h"

@implementation NSString (Calculate)

#pragma mark - Single Line String
- (CGSize)stringSizeWithFont:(UIFont *)font {
    return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}

- (CGFloat)stringLengthWithFont:(UIFont *)font {
    return [self stringSizeWithFont:font].width;
}

- (CGFloat)stringHeightWithFont:(UIFont *)font {
    return [self stringSizeWithFont:font].height;
}

#pragma mark - Multi Lines String
- (CGSize)stringSizeWithFont:(UIFont *)font boundary:(CGSize)boundary {
    return [self boundingRectWithSize:boundary options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}

- (CGFloat)stringLengthWithFont:(UIFont *)font boundary:(CGSize)boundary {
    return [self stringSizeWithFont:font boundary:boundary].width;
}

- (CGFloat)stringHeightWithFont:(UIFont *)font boundary:(CGSize)boundary {
    return [self stringSizeWithFont:font boundary:boundary].height;
}



@end
