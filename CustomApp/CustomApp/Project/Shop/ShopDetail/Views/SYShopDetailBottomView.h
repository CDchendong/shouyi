//
//  SYShopDetailBottomView.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/8.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYShopDetailBottomView : UIView
// 店铺
@property (weak, nonatomic) IBOutlet UIButton *shopBtn;
// 客服
@property (weak, nonatomic) IBOutlet UIButton *serviceBtn;
// 购物车
@property (weak, nonatomic) IBOutlet UIButton *carBtn;
@property (weak, nonatomic) IBOutlet UILabel *numberLb;
// 加入购物车
@property (weak, nonatomic) IBOutlet UIButton *inCarBtn;
// 立即购买
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;

+ (instancetype)memberFooter;
@end

NS_ASSUME_NONNULL_END
