//
//  SYShopCouponVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/16.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopCouponVC.h"
#import "SYShopCouponCell.h"
#import "SYShopCouponBottom.h"

@interface SYShopCouponVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SYShopCouponBottom *bottomView;
@end

@implementation SYShopCouponVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.navigationItem.title = @"优惠券";
}
- (void)sy_initConfigs{
    SYShopCouponBottom * bottom = [SYShopCouponBottom couponBottomView];
    self.tableView.tableFooterView = bottom;
    self.bottomView = bottom;
}
#pragma mark ----- UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SYShopCouponCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYShopCouponCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark ------- 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame: CGRectMake(0, AUTO_IPHONE_MARGIN_TOP, kScreenWidth, kScreenHeight-AUTO_IPHONE_MARGIN_TOP) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 115;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYShopCouponCell class]) bundle:nil] forCellReuseIdentifier:@"SYShopCouponCell"];
        _tableView.backgroundColor = COLOR_HEXS(@"#F5F8FA");
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
