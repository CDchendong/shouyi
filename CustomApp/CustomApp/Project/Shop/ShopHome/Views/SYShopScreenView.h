//
//  SYShopScreenView.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYShopScreenView : UIView
@property (weak, nonatomic) IBOutlet UILabel *rightLb;
@property (weak, nonatomic) IBOutlet UILabel *leftLb;

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@property (nonatomic, copy) void(^didClick)(void);
@end

NS_ASSUME_NONNULL_END
