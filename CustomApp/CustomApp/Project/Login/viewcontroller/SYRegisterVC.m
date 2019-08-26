//
//  SYRegisterVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/5.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYRegisterVC.h"
#import "SYRegisterNextVC.h"

@interface SYRegisterVC ()

@end

@implementation SYRegisterVC
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.registBtn.layer.borderWidth = 1;
    self.registBtn.layer.borderColor = RGBCOLOR(151, 151,151).CGColor;
    self.registBtn.layer.cornerRadius = 20;
    self.registBtn.layer.masksToBounds = YES;
}

// 返回
- (IBAction)backActionBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
// 注册
- (IBAction)registActionBtn:(id)sender {
    SYRegisterNextVC * vc = [SYRegisterNextVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
// 发送验证码
- (IBAction)codeActionBtn:(id)sender {
     [self.codeBtn resume];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
