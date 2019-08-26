//
//  SYShopSearchHotCell.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol didclickTitleDelegate <NSObject>

- (void)didclcikName:(NSString *)name;

@end
@interface SYShopSearchHotCell : UITableViewCell
@property (nonatomic, weak)id<didclickTitleDelegate>delegate;

- (void)reloadDataSource:(NSMutableArray *)dataSource idSource:(NSMutableArray *)idData sizeCalculated:(void(^)(CGSize size))calculated;
@end

NS_ASSUME_NONNULL_END
