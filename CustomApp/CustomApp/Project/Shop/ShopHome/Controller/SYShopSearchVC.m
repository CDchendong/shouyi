//
//  SYShopSearchVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/6.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopSearchVC.h"
#import "SYSearchTextField.h"
#import "SYShopSearchHotCell.h"
#import "SYShopSearchModel.h"
#import "SYShopSearchHistoryCell.h"
#import "SYShopSearchChoiceVC.h"
@interface SYShopSearchVC ()<UITableViewDelegate,UITableViewDataSource,didclickTitleDelegate,UITextFieldDelegate>
@property (nonatomic, strong)SYSearchTextField *searchTextField;
@property (nonatomic, strong) UITableView *tableView;
// 热门推荐
@property (nonatomic, strong) NSMutableArray * hotArray;
@property (nonatomic, assign) CGFloat hotCellHeight;
// 搜索历史
//一个用来归档，一个用来显示
@property (strong,nonatomic) NSMutableArray <SYShopSearchModel *>* historySearchArr;
@property (strong,nonatomic) NSMutableArray <SYShopSearchModel *>* historyShowSearchArr;


@end

@implementation SYShopSearchVC

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self reloadSearch];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _hotCellHeight = 0.f;
    [self setNaviUI];
    [self.view addSubview:self.tableView];
    self.navigationItem.titleView = self.searchTextField;
    _hotArray = [NSMutableArray arrayWithObjects:@"123123",@"123123",@"xvvxvxvxv",@"55456456546",@"123123",@"123123",@"xvvxvxvxv",@"55456456546",@"44",@"99999999999999999",nil];
}
- (void)setNaviUI{
    //设置导航栏透明
    [self.navigationController.navigationBar setTranslucent:true];
    //把背景设为空
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //处理导航栏有条线的问题
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];//设置NavigationBar上的title的颜色
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.view.backgroundColor = COLOR_HEXS(@"#F5F8FA");
}


#pragma mark ----- UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return (self.hotArray.count ? 1 : 0) + (self.historyShowSearchArr.count ? 1 : 0);
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.hotArray.count ? 1 : self.historyShowSearchArr.count;
    } else {
        return self.historyShowSearchArr.count;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        SYShopSearchHotCell *hotCell = [tableView dequeueReusableCellWithIdentifier:@"SYShopSearchHotCell" forIndexPath:indexPath];
        hotCell.delegate =self;
        WeakSelf(self)
        if (self.hotArray.count>0) {
            [hotCell reloadDataSource:self.hotArray  idSource:nil sizeCalculated:^(CGSize size) {
                StrongSelf(self);
                if (self.hotCellHeight != size.height) {
                    self.hotCellHeight = size.height;
                    [self.tableView reloadData];
                }
            }];
        }
        return hotCell;
    }
    // 历史
    SYShopSearchHistoryCell *historyCell = [tableView dequeueReusableCellWithIdentifier:@"SYShopSearchHistoryCell" forIndexPath:indexPath];
    [historyCell setSearchHistoryModel:self.historyShowSearchArr[indexPath.row]];
    historyCell.deleteHandle = ^{
        [self.historySearchArr removeObjectAtIndex:self.historySearchArr.count-indexPath.row -1];
        [self.historyShowSearchArr removeObjectAtIndex:indexPath.row];
        [self saveHistorySearch];
        [self.tableView reloadData];
    };
    return historyCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && self.hotArray.count) {
        NSLog(@"热门高度%@", @(self.hotCellHeight));
        return self.hotCellHeight;
    }
   
    return 45;
    
    
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, kScreenWidth, 35);
    view.backgroundColor = COLOR_HEXS(@"#F5F8FA");
    UILabel *left = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 200, 35)];
    left.font = [UIFont systemFontOfSize:14];
    [view addSubview:left];
    UIButton *more =[UIButton buttonWithType:UIButtonTypeCustom];
   
    more.frame = CGRectMake(kScreenWidth-50, 0, 35,35);
    [more setTitleColor:COLOR_HEXS(@"#666666") forState:UIControlStateNormal];
    more.titleLabel.font = [UIFont systemFontOfSize:15];
    [view addSubview:more];
    if (section == 0) {
        left.text = @"热门搜索";
        [more addTarget:self action:@selector(gotoLoad) forControlEvents:UIControlEventTouchUpInside];
         [more setImage:kImageNamed(@"icon_home_reset") forState:UIControlStateNormal];
    }
    if (section == 1) {
        left.text = @"搜索历史";
        [more addTarget:self action:@selector(gotoClear) forControlEvents:UIControlEventTouchUpInside];
         [more setImage:kImageNamed(@"icon_ashcan") forState:UIControlStateNormal];
    }
   
    return  view;;
}

#pragma mark ----- 热门搜索
- (void)didclcikName:(NSString *)name{
    SYShopSearchChoiceVC *vc = [SYShopSearchChoiceVC new];
    vc.searchStr = name;
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"点击热门");
}

#pragma mark ----- 清空历史刷新
- (void)gotoClear{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"message:@"确定清空历史记录吗?"preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [self.historySearchArr removeAllObjects];
            [self.historyShowSearchArr removeAllObjects];
            [self saveHistorySearch];
            [self.tableView reloadData];
    }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
    }];
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)gotoLoad{
    
}

#pragma mark ------ 内容搜索UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSLog(@"点击了搜索");
    [self addHistoryModelWithText:textField.text andType:HistorySearchSuplly];
    [self saveHistorySearch];
    [self reloadSearch];
    SYShopSearchChoiceVC *vc = [SYShopSearchChoiceVC new];
    vc.searchStr = textField.text;
    [self.navigationController pushViewController:vc animated:YES];
    return YES;
    
}
#pragma mark ------ 搜索历史归档解档
//历史搜索归档
-(void)saveHistorySearch{
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [Path stringByAppendingPathComponent:@"historySearch.data"];
    NSLog(@"%@", filePath);
    for (SYShopSearchModel *model in self.historySearchArr ) {
        NSLog(@"----%@////",model.title);
    }
    for (SYShopSearchModel *model in self.historyShowSearchArr ) {
        NSLog(@"----%@-----",model.title);
    }
    //归档
    [NSKeyedArchiver archiveRootObject:self.historySearchArr toFile:filePath];
}
//历史搜索解档
-(void)readHistorySearch{
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [Path stringByAppendingPathComponent:@"historySearch.data"];
    //解档
    NSMutableArray<SYShopSearchModel *> *personArr = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    for (SYShopSearchModel *model in self.historySearchArr ) {
        NSLog(@"----%@////",model.title);
    }
    self.historySearchArr = [NSMutableArray arrayWithArray:personArr];
    self.historyShowSearchArr =[NSMutableArray arrayWithArray:(NSMutableArray *) [[self.historySearchArr reverseObjectEnumerator]allObjects]];
    for (SYShopSearchModel *model in self.historySearchArr ) {
        NSLog(@"----%@////",model.title);
    }
    for (SYShopSearchModel *model in self.historyShowSearchArr ) {
        NSLog(@"----%@-----",model.title);
    }
    [self.tableView reloadData];
}
//判断搜索记录是否重复后添加
-(void)addHistoryModelWithText:(NSString *)text andType:(HistorySearchType)type{
    //    重复的标志
    NSArray * array = [NSArray arrayWithArray: self.historySearchArr];
    BOOL isRepet = NO;
    for (SYShopSearchModel *model in array) {
        if (model.type == HistorySearchSuplly &&  [model.title isEqualToString:text]) {
            [self.historySearchArr removeObject:model];
            [self.historySearchArr addObject:[SYShopSearchModel initWithTitle:text andType:type]];
            isRepet = YES;
        }
    }
    if (!isRepet) {
        [self.historySearchArr addObject:[SYShopSearchModel initWithTitle:text andType:type]];
    }
    NSLog(@"%@",self.historySearchArr);
    for (SYShopSearchModel *model in self.historySearchArr ) {
        NSLog(@"----%@-----",model.title);
    }
    
}
- (void)reloadSearch{
    [self.historyShowSearchArr removeAllObjects];
    [self readHistorySearch];
    
    [self.tableView reloadData];
}

#pragma mark ------ 懒加载
-(NSMutableArray<SYShopSearchModel *> *)historySearchArr
{
    if (!_historySearchArr) {
        _historySearchArr = [NSMutableArray array];
        
    }
    return _historySearchArr;
}
-(NSMutableArray<SYShopSearchModel *> *)historyShowSearchArr
{
    if (!_historyShowSearchArr) {
        _historyShowSearchArr = [NSMutableArray array];
        
    }
    return _historyShowSearchArr;
}
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
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame: CGRectMake(0, AUTO_IPHONE_MARGIN_TOP, kScreenWidth, kScreenHeight-AUTO_IPHONE_MARGIN_TOP) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.estimatedSectionHeaderHeight = 35;
        [_tableView registerClass:[SYShopSearchHotCell class] forCellReuseIdentifier:@"SYShopSearchHotCell"];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYShopSearchHistoryCell class]) bundle:nil] forCellReuseIdentifier:@"SYShopSearchHistoryCell"];
        _tableView.backgroundColor = COLOR_HEXS(@"#F5F8FA");
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
@end
