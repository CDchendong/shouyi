//
//  BaseTableViewVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/19.
//  Copyright © 2019 eims. All rights reserved.
//

#import "BaseTableViewVC.h"

@interface BaseTableViewVC ()

@end

@implementation BaseTableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, AUTO_IPHONE_MARGIN_TOP, kScreenWidth, kScreenHeight-AUTO_IPHONE_MARGIN_TOP) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
#pragma mark - 添加刷新
- (void)addRefresh
{
    __weak typeof (self) wself = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        wself.page=1;
        [wself startRequest];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"释放刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"刷新中" forState:MJRefreshStateRefreshing];
    self.tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        wself.page++;
        [wself startRequest];
    }];
    [footer setTitle:@"上拉加载" forState:MJRefreshStateIdle];
    [footer setTitle:@"释放加载" forState:MJRefreshStatePulling];
    [footer setTitle:@"加载中" forState:MJRefreshStateRefreshing];
    self.tableView.mj_footer = footer;
}
//- (void)addGifRefresh
//{
//    NSMutableArray *refreshingArray = [NSMutableArray array];
//    for (NSInteger i=1 ; i<25; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading%ld",i]];
//        [refreshingArray addObject:image];
//    }
//    
//    __weak typeof (self) wself = self;
//    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
//        wself.page=1;
//        [wself startRequest];
//    }];
//    header.lastUpdatedTimeLabel.hidden = YES;
//    header.stateLabel.hidden = YES;
//    
//    [header setImages:@[refreshingArray.firstObject] duration:0.0 forState:MJRefreshStateIdle]; // 上拉加载
//    [header setImages:@[refreshingArray.firstObject] duration:0.0 forState:MJRefreshStatePulling]; // 释放加载
//    [header setImages:refreshingArray duration:1.0 forState:MJRefreshStateRefreshing]; // 刷新中
//    self.tableView.mj_header = header;
//    
//    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
//        
//        wself.page++;
//        [wself startRequest];
//    }];
//    footer.refreshingTitleHidden = YES;
//    [footer setImages:@[refreshingArray.firstObject] duration:0.0 forState:MJRefreshStateIdle]; // 上拉加载
//    [footer setImages:@[refreshingArray.firstObject] duration:0.0 forState:MJRefreshStatePulling]; // 释放加载
//    [footer setImages:refreshingArray duration:1.0 forState:MJRefreshStateRefreshing]; // 加载中
//    self.tableView.mj_footer = footer;
//}

-(void)updateMJRefreshStateWithPage:(NSInteger)page andDataArray:(NSArray *)dataArray
{
    [self updateMJRefreshStateWithPage:page andDataArray:dataArray everyPageCount:nil];
}
-(void)updateMJRefreshStateWithPage:(NSInteger)page andDataArray:(NSArray *)dataArray everyPageCount:(nullable NSString *)pageCountStr
{
    if (page==1) {
        [self.tableView.mj_header endRefreshing];
        self.tableView.mj_footer.state=MJRefreshStateIdle;
    }else{
        [self.tableView.mj_footer endRefreshing];
    }
    
    NSInteger every_page_count = pageCountStr?[pageCountStr integerValue]:10;
    
    if ([dataArray count] < every_page_count)
    {
        // 没有更多数据
        self.tableView.mj_footer.state=MJRefreshStateNoMoreData;
    }
    
}
-(void)checkDataSource:(NSArray *)sources andNoDataTitle:(NSString *)title andParentView:(nullable UIView *)view
{
    [self checkDataSource:sources andNoDataTitle:title andParentView:view andImageName:@"defult image name"];
}

-(void)checkDataSource:(NSArray *)sources andNoDataTitle:(NSString *)title andParentView:(nullable UIView *)view andImageName:(NSString *)imageName
{
    UIView *parentView=view?:self.view;
    if (sources.count==0) {
        // 没有数据
        if (!_noDataImageView) {
            
            //            _noDataImageView=[UIView noContentViewWithTitle:title withImageName:imageName];
            //            _noDataImageView.center = CGPointMake(SCREEN_WIDTH/2, ConvertTo6_H(440)*CT_SCALE_Y);
            
            // 创建一个要显示的视图
            [parentView addSubview:_noDataImageView];
        }
    }else
    {
        // 有数据
        if (_noDataImageView) {
            [_noDataImageView removeFromSuperview];
            _noDataImageView=nil;
        }
    }
    
}

#pragma mark - 配置navigationBar 子类重写
- (void)configNavigationBar
{
    
}
#pragma mark - 加载数据 子类重写
-(void)startRequest
{
    
}

#pragma mark - tableViewDelegate 子类重写
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
@end
