//
//  SYMineVC.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/5.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYMineVC.h"
#import "SYLoginVC.h"
@interface SYMineVC ()

@end

@implementation SYMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)gotoLogin:(id)sender {
    SYLoginVC *vc = [SYLoginVC new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:nav animated:YES completion:^{
        
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
