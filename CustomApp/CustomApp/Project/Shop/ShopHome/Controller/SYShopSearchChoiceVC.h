//
//  SYShopSearchChoiceVC.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import "BaseViewVC.h"

typedef NS_ENUM(NSInteger, SYShopType) {
    ///新品推荐
    SYShopNew,
    ///热销推荐
    SYShopHot,
    ///优选列表
    SYShopBest
    
};

NS_ASSUME_NONNULL_BEGIN

@interface SYShopSearchChoiceVC : BaseViewVC


@property (nonatomic, assign)SYShopType shopType;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *sliderView;
@property (weak, nonatomic) IBOutlet UIImageView *firstImage;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;

@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *threeView;
@property (weak, nonatomic) IBOutlet UIView *fourView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSString * searchStr;
@end

NS_ASSUME_NONNULL_END
