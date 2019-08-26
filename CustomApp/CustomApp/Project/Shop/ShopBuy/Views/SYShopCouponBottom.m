//
//  SYShopCouponBottom.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/16.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopCouponBottom.h"

@implementation SYShopCouponBottom
+ (instancetype)couponBottomView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
