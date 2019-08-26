//
//  SYShopCommentDetailVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/15.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopCommentDetailVC.h"
#import "SYShopDetailCommentCell.h"
#import "SYShopDetailAllCommentCell.h"
#import "SYShopDetailCBottomView.h"
@interface SYShopCommentDetailVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) SYShopDetailCBottomView *bottomView;
@end

@implementation SYShopCommentDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.navigationItem.title = @"评价详情";
    [self.view addSubview:self.textField];
//    SYShopDetailCBottomView * bottomView = [SYShopDetailCBottomView commentBottomView];
//    [self.view addSubview:bottomView];
//    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.view);
//        make.height.mas_equalTo(40);
//    }];
}

#pragma mark ----- UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 40;
    }
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, -10, kScreenWidth, 40)];
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
        topView.backgroundColor = COLOR_HEXS(@"#F5F5F5");
        [view addSubview:topView];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 10, 200, 30)];
        label.font = [UIFont systemFontOfSize:13];
        label.text = [NSString stringWithFormat:@"全部评论（%d）",123];
        [view addSubview:label];
        return view;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SYShopDetailCommentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SYShopDetailCommentCell" forIndexPath:indexPath];
        return cell;
    }
    
    SYShopDetailAllCommentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SYShopDetailAllCommentCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark ------ UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark ------ tableview header 滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y> 0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }else
        if(scrollView.contentOffset.y >= sectionHeaderHeight){
            
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
}

#pragma mark ------ 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame: CGRectMake(0, AUTO_IPHONE_MARGIN_TOP, kScreenWidth, kScreenHeight-AUTO_IPHONE_MARGIN_TOP) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 50;
        [_tableView registerClass:[SYShopDetailCommentCell class] forCellReuseIdentifier:@"SYShopDetailCommentCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"SYShopDetailAllCommentCell" bundle:nil] forCellReuseIdentifier:@"SYShopDetailAllCommentCell"];
        _tableView.backgroundColor = COLOR_HEXS(@"0xEBEBEB");
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [UITextField new];
        _textField.frame = CGRectMake(0, kScreenHeight-35, kScreenWidth, 35);
        _textField.delegate = self;
        _textField.backgroundColor = COLOR_HEXS(@"#F5F5F5");
        _textField.borderStyle =UITextBorderStyleNone;
        _textField.returnKeyType = UIReturnKeyDone;
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请输入评价" attributes:
                                          @{NSForegroundColorAttributeName:COLOR_HEXS(@"#808080"),
                                            NSFontAttributeName:[UIFont systemFontOfSize:13]
                                            }];
        _textField.attributedPlaceholder = attrString;
       
    }
    return _textField;
}
@end
