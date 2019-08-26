//
//  SYShopDetailVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopDetailVC.h"
#import "SYShopDetailBottomView.h"
#import "SYShopDetailCouponView.h"
#import "SYShopDetailShareView.h"
#import "SYShopDetailNormsView.h"
#import "SYShopDetailCommentVC.h"
#import "SYShopSearchChoiceVC.h"
#import "SYSureOrderVC.h"
@interface SYShopDetailVC ()
@property (nonatomic, strong) SYShopDetailBottomView *bottomView;
@property (nonatomic, strong) SYShopDetailCouponView *couponView;
@property (nonatomic, strong) SYShopDetailNormsView *normsView;
@property (nonatomic, strong) SYShowAlterView *couponAlertView;
@property (nonatomic, strong) SYShopDetailShareView * shareView;
@end

@implementation SYShopDetailVC
//- (SYShopDetailBottomView *)bottomView{
//    if (!_bottomView) {
//        _bottomView = [[SYShopDetailBottomView alloc] initWithFrame:CGRectMake(0, 400, kScreenWidth, 80)];
//    }
//    return _bottomView;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"商品详情";
    [self setNavRightBtn:@"" image:@"icon_share"];

}

- (void)sy_initConfigs{
    SYShopDetailBottomView *bottomView = [SYShopDetailBottomView memberFooter];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-AUTO_IPHONE_SAFE_AREA_BOTTOM);
        make.left.right.equalTo(self.scrollView);
        make.height.mas_equalTo(60.f);
    }];
    self.bottomView = bottomView;
}
- (void)sy_bindEvents{
    @weakify(self);
    [[self.twoCouponBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        // 选择优惠券
        [self showCouponView];
        
    }];
    [[self.threeViewBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        // 选择规格
        [self showNormsView];
        
    }];
    [[self.fourAllBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        // 查看评价
        SYShopDetailCommentVC * vc = [SYShopDetailCommentVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
    [[self.fiveBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        // 商品列表筛选
        SYShopSearchChoiceVC * vc = [SYShopSearchChoiceVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
     [[self.bottomView.buyBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        // 立即购买
        SYSureOrderVC * vc = [SYSureOrderVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
}


- (void)rightAction:(id)sender{
    [self showShareView];
}
#pragma mark ------ 显示优惠券，规格选择
- (void)showCouponView{
    SYShowAlterView * couponAlertView = [SYShowAlterView showAlertViewWithType:SYAlertViewContentTypeBottom toView:nil config:^(UIView * _Nonnull contentView) {
        SYShopDetailCouponView *couponView = [SYShopDetailCouponView couponReceiveView];
        [contentView addSubview:couponView];
        [couponView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(contentView);
            make.height.mas_equalTo(kSYCouponViewHeight + AUTO_IPHONE_SAFE_AREA_BOTTOM);
        }];
        self.couponView = couponView;
    }];
    NSLog(@"弹出优惠券");
    self.couponAlertView = couponAlertView;
    // Close Coupons Alert View
    @weakify(self);
    [[self.couponView.closeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.couponAlertView dismissAnimated:YES];
    }];
}

- (void)showNormsView{
    SYShowAlterView * normsAlertView = [SYShowAlterView showAlertViewWithType:SYAlertViewContentTypeBottom toView:nil config:^(UIView * _Nonnull contentView) {
        SYShopDetailNormsView *normsView = [SYShopDetailNormsView detailNormsView];
        [contentView addSubview:normsView];
        [normsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(contentView);
            make.height.mas_equalTo(kSYNormsViewHeight + AUTO_IPHONE_SAFE_AREA_BOTTOM);
        }];
        self.normsView = normsView;
    }];
    
    self.couponAlertView = normsAlertView;
    // Close Coupons Alert View
    @weakify(self);
    [[self.normsView.closeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.couponAlertView dismissAnimated:YES];
    }];
    
    [[self.normsView.buyNowBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.couponAlertView dismissAnimated:YES];
    }];
}
- (void)showShareView{
    SYShowAlterView * shareAlertView = [SYShowAlterView showAlertViewWithType:SYAlertViewContentTypeBottom toView:nil config:^(UIView * _Nonnull contentView) {
        SYShopDetailShareView *shareView = [SYShopDetailShareView shareView];
        
        [contentView addSubview:shareView];
        [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(contentView);
            make.height.mas_equalTo(kSYShareViewHeight + AUTO_IPHONE_SAFE_AREA_BOTTOM);
        }];
        self.shareView = shareView;
    }];
    
    self.couponAlertView = shareAlertView;
    // Close Coupons Alert View
    @weakify(self);
    [[self.shareView.closeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.couponAlertView dismissAnimated:YES];
    }];
}
@end
