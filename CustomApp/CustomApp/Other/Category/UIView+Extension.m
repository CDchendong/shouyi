//
//  UIView+Extension.m
//  CustomApp
//
//  Created by CDchen on 2019/4/17.
//  Copyright © 2019 eims. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWw:(CGFloat)ww {
    CGRect frame = self.frame;
    frame.size.width = ww;
    self.frame = frame;
}

- (void)setHh:(CGFloat)hh {
    CGRect frame = self.frame;
    frame.size.height = hh;
    self.frame = frame;
}

- (CGFloat)hh {
    return self.frame.size.height;
}

- (CGFloat)ww {
    return self.frame.size.width;
}

- (void)setSs:(CGSize)ss {
    CGRect frame = self.frame;
    frame.size = ss;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (CGSize)ss {
    return self.frame.size;
}

- (CGFloat)bbottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBbottom:(CGFloat)bbottom {
    CGRect frame = self.frame;
    frame.origin.y = ceilf(bbottom - frame.size.height);
    self.frame = frame;
}

- (CGFloat)rright {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRright:(CGFloat)rright {
    CGRect frame = self.frame;
    frame.origin.x = ceilf(rright - frame.size.width);
    self.frame = frame;
}
@end
