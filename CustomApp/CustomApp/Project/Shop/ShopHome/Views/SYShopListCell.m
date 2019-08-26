//
//  SYShopListCell.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/6.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopListCell.h"

@implementation SYShopListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
