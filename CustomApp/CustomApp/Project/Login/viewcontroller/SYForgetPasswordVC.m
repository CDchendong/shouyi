//
//  SYForgetPasswordVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/5.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYForgetPasswordVC.h"

@interface SYForgetPasswordVC ()


@end

@implementation SYForgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtn:@"" image:@"icon_back_black"];
    self.navigationItem.title = @"忘记密码";
}
- (IBAction)sendCodeBtn:(id)sender {
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
