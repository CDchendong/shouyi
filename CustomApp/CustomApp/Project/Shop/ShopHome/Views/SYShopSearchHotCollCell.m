//
//  SYShopSearchHotCollCell.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopSearchHotCollCell.h"

@implementation SYShopSearchHotCollCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLB.layer.cornerRadius = 12;
    self.titleLB.layer.masksToBounds = YES;
}

@end
