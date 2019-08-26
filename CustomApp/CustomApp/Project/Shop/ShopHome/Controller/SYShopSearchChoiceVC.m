//
//  SYShopSearchChoiceVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopSearchChoiceVC.h"
#import "SYSearchTextField.h"
#import "SYShopListCell.h"
#import "SYShopScreenView.h"
@interface SYShopSearchChoiceVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)SYSearchTextField *searchTextField;
@property (nonatomic, strong)SYShopScreenView *screeView;
@end

@implementation SYShopSearchChoiceVC
- (SYShopScreenView *)screeView{
    if (!_screeView) {
        _screeView = [[SYShopScreenView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight)];
    }
    return _screeView;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.searchTextField.text = self.searchStr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNaviUI];
    self.navigationItem.title = @"商品列表";
    [[UIApplication sharedApplication].keyWindow addSubview:self.screeView];
    [_tableView registerNib:[UINib nibWithNibName:@"SYShopListCell" bundle:nil] forCellReuseIdentifier:@"SYShopListCell"];
    _tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedRowHeight = 130;
//    self.navigationItem.titleView = self.searchTextField;
}
- (void)setNaviUI{
//    //设置导航栏透明
//    [self.navigationController.navigationBar setTranslucent:true];
//    //把背景设为空
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    //处理导航栏有条线的问题
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
//    //1。
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];//设置NavigationBar上的title的颜色
//    //2.
//    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.view.backgroundColor = COLOR_HEXS(@"#F5F8FA");
}

#pragma mark ------ 筛选点击

- (IBAction)choiceActionBtn:(UIButton *)sender {
    if (sender.tag!=1000) {
     self.firstImage.transform=CGAffineTransformMakeRotation(M_PI);
    }else{
         self.firstImage.transform= CGAffineTransformMakeRotation(180 * M_PI );
    }
    if (sender.tag == 1000) {
        NSLog(@"综合");
        [self.sliderView setFrame:CGRectMake(19, 37, 40, 3)];
    }
    if (sender.tag == 1001) {
        NSLog(@"销量");
        [self.sliderView setFrame:CGRectMake(_twoView.centerX-20, 37, 40, 3)];
    }
    if (sender.tag == 1002) {
        NSLog(@"人气");
        [self.sliderView setFrame:CGRectMake(_threeView.centerX -20, 37, 40, 3)];
    }
    if (sender.tag == 1003) {
        NSLog(@"筛选");
        WeakSelf(self);
        [self.sliderView setFrame:CGRectMake(_fourView.centerX -20, 37, 40, 3)];
        [UIView animateWithDuration:0.2 animations:^{
            self.screeView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        }];
        
        self.screeView.didClick = ^{
            StrongSelf(self);
            [UIView animateWithDuration:0.2 animations:^{
                self.screeView.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight);
            }];
        };
        
    }
    
}
- (void)hideScreen{
    NSLog(@"点击确定");
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

#pragma mark ------ 懒加载
- (SYSearchTextField *)searchTextField{
    if(!_searchTextField){
        _searchTextField = [[SYSearchTextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 76, 32)];
        _searchTextField.layer.cornerRadius = 16;
        _searchTextField.font = [UIFont systemFontOfSize:14];
        _searchTextField.clipsToBounds = YES;
        _searchTextField.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        _searchTextField.returnKeyType = UIReturnKeySearch;
        _searchTextField.delegate = self;
        [_searchTextField setTintColor:[UIColor grayColor]];
        _searchTextField.logoColor = [UIColor grayColor];
        NSMutableAttributedString *attribuedString = [[NSMutableAttributedString alloc]initWithString:@"大家都在搜索"];
        [attribuedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:COLOR_HEXS(@"#666666")} range:NSMakeRange(0, attribuedString.length)];
        _searchTextField.attributedPlaceholder = attribuedString;
        
    }
    return _searchTextField;
}

@end
