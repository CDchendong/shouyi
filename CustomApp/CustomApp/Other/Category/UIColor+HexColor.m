//
//  UIColor+HexColor.m
//  ZhongChao
//
//  Created by JuncyChen on 2019/5/18.
//  Copyright © 2019 Danke. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat a, r, b, g;
    switch ([colorString length]) {
        case 3: // #RGB
            a = 1.0f;
            r = [self colorComponentFrom:colorString withRange:NSMakeRange(0, 1)];
            g = [self colorComponentFrom:colorString withRange:NSMakeRange(1, 1)];
            b = [self colorComponentFrom:colorString withRange:NSMakeRange(2, 1)];
            break;
        case 4: // #ARGB
            a = [self colorComponentFrom:colorString withRange:NSMakeRange(0, 1)];
            r = [self colorComponentFrom:colorString withRange:NSMakeRange(1, 1)];
            g = [self colorComponentFrom:colorString withRange:NSMakeRange(2, 1)];
            b = [self colorComponentFrom:colorString withRange:NSMakeRange(3, 1)];
            break;
        case 6: // #RRGGBB
            a = 1.0f;
            r = [self colorComponentFrom:colorString withRange:NSMakeRange(0, 2)];
            g = [self colorComponentFrom:colorString withRange:NSMakeRange(2, 2)];
            b = [self colorComponentFrom:colorString withRange:NSMakeRange(4, 2)];
            break;
        case 8: // #AARRGGBB
            a = [self colorComponentFrom:colorString withRange:NSMakeRange(0, 2)];
            r = [self colorComponentFrom:colorString withRange:NSMakeRange(2, 2)];
            g = [self colorComponentFrom:colorString withRange:NSMakeRange(4, 2)];
            b = [self colorComponentFrom:colorString withRange:NSMakeRange(6, 2)];
            break;
        default:
            a = 0.f;
            r = 0.f;
            g = 0.f;
            b = 0.f;
            break;
    }
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

+ (CGFloat)colorComponentFrom:(NSString *)string withRange:(NSRange)range {
    NSString *substring = [string substringWithRange:range];
    NSString *fullHex = range.length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

@end
