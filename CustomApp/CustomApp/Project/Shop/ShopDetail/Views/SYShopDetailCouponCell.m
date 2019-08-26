//
//  SYShopDetailCouponCell.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/8.
//  Copyright © 2019 eims. All rights reserved.
//

/**
 * 领券
 **/

#import "SYShopDetailCouponCell.h"

@implementation SYShopDetailCouponCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)getCouponBtn:(UIButton *)sender {
    if (self.receiveCoupon) {
        self.receiveCoupon();
    }
}

@end
