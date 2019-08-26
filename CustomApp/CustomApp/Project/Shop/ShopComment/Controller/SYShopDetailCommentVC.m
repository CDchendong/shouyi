//
//  SYShopDetailCommentVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/15.
//  Copyright © 2019 eims. All rights reserved.
//

/**
 * 商品评论
 */

#import "SYShopDetailCommentVC.h"
#import "SYShopDetailCommentCell.h"
#import "SYShopCommentDetailVC.h"

@interface SYShopDetailCommentVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation SYShopDetailCommentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"评价列表";
    [self.view addSubview:self.tableView];
}

#pragma mark ----- UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SYShopDetailCommentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SYShopDetailCommentCell" forIndexPath:indexPath];

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SYShopCommentDetailVC * vc = [SYShopCommentDetailVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return estimatedRowHeight;
//}
#pragma mark ------ 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame: CGRectMake(0, AUTO_IPHONE_MARGIN_TOP, kScreenWidth, kScreenHeight-AUTO_IPHONE_MARGIN_TOP) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 50;
        [_tableView registerClass:[SYShopDetailCommentCell class] forCellReuseIdentifier:@"SYShopDetailCommentCell"];
        _tableView.backgroundColor = COLOR_HEXS(@"0xEBEBEB");
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
@end
