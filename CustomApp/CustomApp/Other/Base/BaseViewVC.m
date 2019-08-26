//
//  BaseViewVC.m
//  CustomApp
//
//  Created by CDchen on 2019/4/17.
//  Copyright © 2019 eims. All rights reserved.
//

#import "BaseViewVC.h"

#define NAV_BTN_PADDING_IMAGE 8
#define NAV_BTN_PADDING_TEXT 10

@interface BaseViewVC ()

@end

@implementation BaseViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sy_initConfigs];
    [self sy_bindEvents];
}
- (void)sy_initConfigs{}

- (void)sy_bindEvents{}
#pragma mark ------------ 导航栏
//导航栏标题
- (void)setNavTitle:(NSString *)title {
    
    if ([title isNotEmpty]) {
        UILabel *titleLB = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-120, 44)];
        [titleLB setFont:[UIFont systemFontOfSize:20.0]];
        [titleLB setText:title];
        [titleLB setTextAlignment:NSTextAlignmentCenter];
        [titleLB setBackgroundColor:[UIColor clearColor]];
        [titleLB setTextColor:[UIColor blackColor]];
        // 字体大小自适应
        titleLB.minimumScaleFactor = 1.0;
        titleLB.adjustsFontSizeToFitWidth = YES;
        [self.navigationItem setTitle:titleLB.text];
    }
}
//导航栏返回
- (void)setNavBackBtn {
    
    [self setNavLeftBtn:@"" image:nil];
}

- (void)setNavLeftBtn:(NSString *)title
                image:(NSString *)imageName {
    
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    if ([title isNotEmpty]) {
        [leftBtn setTitle:title forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        leftBtn.ww = [title sizeInSize:CGSizeMake(100, 22) andFont:[UIFont systemFontOfSize:15]].width + NAV_BTN_PADDING_TEXT;
    } else {
        UIImage *image = nil;
        if ([imageName isKindOfClass:[NSNull class]]) {
            image = [UIImage imageNamed:imageName];
        } else {
            image = [UIImage imageNamed:@"icon_back_black"];
        }
        leftBtn.ww = image.size.width + NAV_BTN_PADDING_IMAGE;
        [leftBtn setImage:image forState:UIControlStateNormal];
    }
    
    leftBtn.exclusiveTouch = YES;
    [leftBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = btn;
}

//右侧导航栏按钮
- (void)setNavRightBtn:(NSString *)title
                 image:(NSString *)imageName {
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    if ([title isNotEmpty]) {
        [rightBtn setTitle:title forState:UIControlStateNormal];
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        rightBtn.ww = [title sizeInSize:CGSizeMake(100, 22) andFont:[UIFont systemFontOfSize:15]].width + NAV_BTN_PADDING_TEXT;
    } else {
        UIImage *image = [UIImage imageNamed:imageName];
        rightBtn.ww = image.size.width + NAV_BTN_PADDING_IMAGE;
        [rightBtn setImage:image forState:UIControlStateNormal];
    }
    
    rightBtn.exclusiveTouch = YES;
    [rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = btn;
}
- (void)setNavRightBtn:(NSArray *)array {
    
    if ([array isNotEmpty]) {
        NSMutableArray *btnArray = [[NSMutableArray alloc] initWithCapacity:0];
        NSInteger index = 0;
        for (NSString *str in array) {
            UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
            
            UIImage *image = [UIImage imageNamed:str];
            if (image) {
                [rightBtn setImage:image forState:UIControlStateNormal];
                rightBtn.ww = image.size.width + NAV_BTN_PADDING_IMAGE;
            } else {
                [rightBtn setTitle:str forState:UIControlStateNormal];
                rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                rightBtn.ww = [str sizeInSize:CGSizeMake(100, 22) andFont:[UIFont systemFontOfSize:15]].width + NAV_BTN_PADDING_TEXT;
            }
            [rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
            rightBtn.exclusiveTouch = YES;
            rightBtn.tag = 100+index;
            index++;
            UIBarButtonItem * rButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
            [btnArray addObject:rButtonItem];
        }
        self.navigationItem.rightBarButtonItems = btnArray;
    }
    
}
//按钮响应事件

-(void)backAction:(id)sender {
    
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)rightAction:(id)sender {
    
}
- (void)endEditing {
    [self.view endEditing:YES];
}


@end
