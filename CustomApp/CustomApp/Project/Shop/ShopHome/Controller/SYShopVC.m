//
//  SYShopVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/5.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopVC.h"

#import "SDCycleScrollView.h"
#import "SYShopListCell.h"
#import "SYSearchTextField.h"
#import "SYShopSearchVC.h"
#import "SYShopSearchChoiceVC.h"
#import "SYShopDetailVC.h"
@interface SYShopVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) SDCycleScrollView *bannerView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *bannerArray;
@property (nonatomic, strong) SYSearchTextField *searchTextField;
@property (nonatomic, strong) UIView *headBack;
@end

@implementation SYShopVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _bannerArray = @[@"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",@"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",@"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                     ];
    [self setUI];
}

- (void)setUI{
    self.tableView.tableHeaderView = self.headBack;
    self.navigationItem.titleView = self.searchTextField;
  
    [self.view addSubview:self.tableView];
    [self.headBack addSubview:self.bannerView];
    _bannerView.imageURLStringsGroup = self.bannerArray;
    
}

#pragma mark ----- UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SYShopListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYShopListCell" forIndexPath:indexPath];
   
    return cell;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, kScreenWidth, 40);
    view.backgroundColor = [UIColor whiteColor];
    UILabel *left = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 200, 40)];
    left.font = [UIFont systemFontOfSize:18];
    [view addSubview:left];
    UIImageView *nextImg = [[UIImageView alloc] initWithImage:kImageNamed(@"icon_setting_next")];
    nextImg.frame = CGRectMake(kScreenWidth-20, 13, 9, 14);
    [view addSubview:nextImg];
    UIButton *more =[UIButton buttonWithType:UIButtonTypeCustom];
    [more setTitle:@"更多" forState:UIControlStateNormal];
    more.frame = CGRectMake(kScreenWidth-80, 0, 80, 40);
    [more setTitleColor:COLOR_HEXS(@"#666666") forState:UIControlStateNormal];
    more.titleLabel.font = [UIFont systemFontOfSize:15];
    [view addSubview:more];
    if (section == 0) {
        left.text = @"新品推荐";
        [more addTarget:self action:@selector(gotoNewMore) forControlEvents:UIControlEventTouchUpInside];
    }
    if (section == 1) {
        left.text = @"热销推荐";
        [more addTarget:self action:@selector(gotoHotMore) forControlEvents:UIControlEventTouchUpInside];
    }
    if (section == 2) {
        left.text = @"优选列表";
        [more addTarget:self action:@selector(gotoGoodMore) forControlEvents:UIControlEventTouchUpInside];
    }
    return  view;;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SYShopDetailVC * vc = [SYShopDetailVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark ------新品、热销、优选 更多
- (void)gotoNewMore{
    SYShopSearchChoiceVC * vc = [SYShopSearchChoiceVC new];
    vc.shopType = SYShopNew;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)gotoHotMore{
    SYShopSearchChoiceVC * vc = [SYShopSearchChoiceVC new];
    vc.shopType = SYShopHot;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)gotoGoodMore{
    SYShopSearchChoiceVC * vc = [SYShopSearchChoiceVC new];
    vc.shopType = SYShopBest;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ------- 去搜索
- (void)gotoSearch{
    NSLog(@"去搜索");
    SYShopSearchVC * vc = [SYShopSearchVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ------- 懒加载
- (SYSearchTextField *)searchTextField{
    if(!_searchTextField){
        _searchTextField = [[SYSearchTextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 76, 32)];
        _searchTextField.layer.cornerRadius = 16;
        _searchTextField.clipsToBounds = YES;
        _searchTextField.backgroundColor = [UIColor colorWithHexString:@"#F5F5F5"];
        _searchTextField.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoSearch)];
        [_searchTextField addGestureRecognizer:tap];
        _searchTextField.logoColor = [UIColor whiteColor];
        NSMutableAttributedString *attribuedString = [[NSMutableAttributedString alloc]initWithString:@"大家都在搜索"];
        [attribuedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:COLOR_HEXS(@"#666666")} range:NSMakeRange(0, attribuedString.length)];
        _searchTextField.attributedPlaceholder = attribuedString;
        
    }
    return _searchTextField;
}
- (SDCycleScrollView *)bannerView{
    if (!_bannerView) {
        _bannerView = [SDCycleScrollView new];
        _bannerView.autoScroll = YES;
        _bannerView.frame =CGRectMake(15, 5, kScreenWidth-30, 150);
        _bannerView.layer.cornerRadius = 10;
        _bannerView.layer.masksToBounds = YES;
        _bannerView.currentPageDotColor = [UIColor whiteColor];
    }
    return _bannerView;
}
- (UIView *)headBack{
    if (!_headBack) {
        _headBack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 160)];
    }
    return _headBack;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame: CGRectMake(0, AUTO_IPHONE_MARGIN_TOP, kScreenWidth, kScreenHeight-AUTO_IPHONE_MARGIN_TOP) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.estimatedRowHeight =130;
        _tableView.estimatedSectionHeaderHeight = 40;
        [_tableView registerNib:[UINib nibWithNibName:@"SYShopListCell" bundle:nil] forCellReuseIdentifier:@"SYShopListCell"];
        _tableView.backgroundColor = COLOR_HEXS(@"0xEBEBEB");
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
@end
