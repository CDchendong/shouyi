//
//  SYShopSearchHistoryCell.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopSearchHistoryCell.h"

@implementation SYShopSearchHistoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = COLOR_HEXS(@"#F5F8FA");
}
- (IBAction)deleteAction:(id)sender {
    if (self.deleteHandle) {
        self.deleteHandle();
    }
}

- (void)setSearchHistoryModel:(SYShopSearchModel *)model{
    self.titleLb.text = model.title;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
