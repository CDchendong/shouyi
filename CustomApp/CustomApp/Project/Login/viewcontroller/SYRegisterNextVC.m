//
//  SYRegisterNextVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/6.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYRegisterNextVC.h"

@interface SYRegisterNextVC ()

@end

@implementation SYRegisterNextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtn:@"" image:@"icon_back_black"];
}
- (IBAction)backActionBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)nextActionBtn:(id)sender {
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
