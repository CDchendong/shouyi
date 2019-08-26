//
//  SYMyHarvestAddressVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/19.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYMyHarvestAddressVC.h"

@interface SYMyHarvestAddressVC ()

@end

@implementation SYMyHarvestAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray arrayWithArray:@[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
      [self addRefresh];
//    [self addGifRefresh];
    [self.tableView.mj_header beginRefreshing];
}

- (void)startRequest
{
    self.dataArray = @[@"",@"",@""];
    [self.tableView reloadData];
    [self updateMJRefreshStateWithPage:self.page andDataArray:self.dataArray];
    NSLog(@"startRequestWithPage:%ld",self.page);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
    
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

@end
