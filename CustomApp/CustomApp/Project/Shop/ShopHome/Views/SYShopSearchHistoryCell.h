//
//  SYShopSearchHistoryCell.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYShopSearchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface SYShopSearchHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

@property (copy, nonatomic) void (^deleteHandle)(void);
- (void)setSearchHistoryModel:(SYShopSearchModel *)model;
@end

NS_ASSUME_NONNULL_END
