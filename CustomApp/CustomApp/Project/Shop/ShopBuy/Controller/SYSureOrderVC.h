//
//  SYSureOrderVC.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/16.
//  Copyright © 2019 eims. All rights reserved.
//

#import "BaseViewVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SYSureOrderVC : BaseViewVC
@property (weak, nonatomic) IBOutlet UIControl *addressControl;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *phoneLb;
@property (weak, nonatomic) IBOutlet UILabel *addressLb;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *typeLb;
@property (weak, nonatomic) IBOutlet UILabel *moneyLb;
@property (weak, nonatomic) IBOutlet UILabel *numberLb;
@property (weak, nonatomic) IBOutlet UIButton *couponBtn;
@property (weak, nonatomic) IBOutlet UILabel *couponLb;
@property (weak, nonatomic) IBOutlet UILabel *totalLb;
@property (weak, nonatomic) IBOutlet UILabel *allMoneyLb;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@end

NS_ASSUME_NONNULL_END
