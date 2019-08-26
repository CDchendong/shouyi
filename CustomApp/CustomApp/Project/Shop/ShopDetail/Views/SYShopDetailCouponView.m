//
//  SYShopDetailCouponView.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/8.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopDetailCouponView.h"
#import "SYShopDetailCouponCell.h"
@interface SYShopDetailCouponView ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation SYShopDetailCouponView
+ (instancetype)couponReceiveView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    self.tableView.rowHeight = 110;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYShopDetailCouponCell class]) bundle:nil] forCellReuseIdentifier:@"SYShopDetailCouponCell"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SYShopDetailCouponCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYShopDetailCouponCell" forIndexPath:indexPath];
    // 领取优惠券
    cell.receiveCoupon = ^{
        
    };
    return cell;
}


@end
