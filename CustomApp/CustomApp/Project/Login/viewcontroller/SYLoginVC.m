//
//  SYLoginVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/5.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYLoginVC.h"
#import "SYRegisterVC.h"
#import "SYForgetPasswordVC.h"

@interface SYLoginVC ()

@end

@implementation SYLoginVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
// 注册
- (IBAction)gotoRegist:(id)sender {
    SYRegisterVC * vc = [SYRegisterVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
// 忘记密码
- (IBAction)gotoForget:(id)sender {
    SYForgetPasswordVC * vc = [SYForgetPasswordVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)backActionBtn:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
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
