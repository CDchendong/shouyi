//
//  SYShopScreenView.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopScreenView.h"
#import "SYShopSearchHotCell.h"

@interface SYShopScreenView ()<didclickTitleDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray * hotArray;
@property (nonatomic, assign) CGFloat hotCellHeight;
//@property (nonatomic, strong) UITableView *tableView;

@end
@implementation SYShopScreenView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"SYShopScreenView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sureActionBtn:)];
        [self.backView addGestureRecognizer:tap];
        self.backView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.3];
        [self setUI];
        
    }
    return self;
}
// 确认按钮
- (IBAction)sureActionBtn:(id *)sender {
    if (self.didClick) {
        self.didClick();
    }
}
- (void)setUI{
    _hotCellHeight = 0;
    self.leftLb.layer.cornerRadius = 8;
    self.rightLb.layer.cornerRadius = 8;
    self.sureBtn.layer.cornerRadius =12;
    self.leftLb.layer.masksToBounds = YES;
    self.rightLb.layer.masksToBounds = YES;
    self.sureBtn.layer.masksToBounds = YES;
    _hotArray = [NSMutableArray arrayWithObjects:@"123123",@"123123",@"xvvxvxvxv",@"55456456546",@"123123",@"123123",@"xvvxvxvxv",@"55456456546",@"44",@"99999999999999999",nil];
     [_tableView registerClass:[SYShopSearchHotCell class] forCellReuseIdentifier:@"SYShopSearchHotCell"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView reloadData];
}
#pragma mark ----- UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.hotCellHeight;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, kScreenWidth, 35);
    view.backgroundColor = COLOR_HEXS(@"#F5F8FA");
    UILabel *left = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 200, 35)];
    left.font = [UIFont systemFontOfSize:14];
    left.text = @"分类";
    [view addSubview:left];
    return  view;;
}

#pragma mark ----- 分类
- (void)didclcikName:(NSString *)name{
    
    NSLog(@"点击分类");
    
}

@end
