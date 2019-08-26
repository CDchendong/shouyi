//
//  SYShopDetailCouponView.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/8.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSYCouponViewHeight 333.F
NS_ASSUME_NONNULL_BEGIN

@interface SYShopDetailCouponView : UIView

@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
+ (instancetype)couponReceiveView;
@end

NS_ASSUME_NONNULL_END
