//
//  SYShopDetailCouponCell.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/8.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYShopDetailCouponCell : UITableViewCell

@property (nonatomic, copy) void(^receiveCoupon)(void);

@end

NS_ASSUME_NONNULL_END
