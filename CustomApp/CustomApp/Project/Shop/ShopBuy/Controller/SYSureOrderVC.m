//
//  SYSureOrderVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/16.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYSureOrderVC.h"
#import "SYShopCouponVC.h"
#import "SYMyHarvestAddressVC.h"
@interface SYSureOrderVC ()

@end

@implementation SYSureOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"确认订单";
}

- (void)sy_bindEvents{
    @weakify(self);
    [[self.addressControl rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        // 更新地址
        SYMyHarvestAddressVC * vc = [SYMyHarvestAddressVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    [[self.couponBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        // 选择优惠券
        SYShopCouponVC * vc = [SYShopCouponVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
}

@end
