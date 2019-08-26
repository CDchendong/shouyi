//
//  SYShopDetailNormsCell.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/8.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopDetailNormsCell.h"

@implementation SYShopDetailNormsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        self.nameLb.textColor = COLOR_HEXS(@"#FF0336");
        self.nameLb.backgroundColor = RGBACOLOR(255, 3, 54, 0.1);
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = COLOR_HEXS(@"#FF0336").CGColor;
        self.layer.masksToBounds = YES;
    }else{
        self.nameLb.textColor = COLOR_HEXS(@"#666666");
        self.nameLb.backgroundColor = [UIColor clearColor];
        self.layer.borderWidth = 0;
        self.layer.masksToBounds = YES;
    }
}
@end
