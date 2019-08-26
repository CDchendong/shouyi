//
//  SYShopDetailVC.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import "BaseViewVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SYShopDetailVC : BaseViewVC
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UILabel *oneTitleLb;
@property (weak, nonatomic) IBOutlet UILabel *onePeopleLb;
@property (weak, nonatomic) IBOutlet UILabel *oneCollectionLb;
@property (weak, nonatomic) IBOutlet UILabel *oneMoneyLb;
@property (weak, nonatomic) IBOutlet UILabel *oneOldLb;
@property (weak, nonatomic) IBOutlet UIButton *oneCollectionBtn;
@property (weak, nonatomic) IBOutlet UIView *bannerView;

@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIButton *twoCouponBtn;
@property (weak, nonatomic) IBOutlet UIView *threeView;
@property (weak, nonatomic) IBOutlet UIButton *threeViewBtn;

@property (weak, nonatomic) IBOutlet UIView *fourView;
@property (weak, nonatomic) IBOutlet UILabel *fourCommentLb;
@property (weak, nonatomic) IBOutlet UIImageView *fourHeaderImg;
@property (weak, nonatomic) IBOutlet UILabel *fourNickName;
@property (weak, nonatomic) IBOutlet UILabel *fourContentLb;
@property (weak, nonatomic) IBOutlet UIButton *fourAllBtn;
@property (weak, nonatomic) IBOutlet UIView *fiveView;
@property (weak, nonatomic) IBOutlet UIImageView *fiveHeaderImg;
@property (weak, nonatomic) IBOutlet UILabel *fiveOneLb;
@property (weak, nonatomic) IBOutlet UILabel *fiveTwoLb;
@property (weak, nonatomic) IBOutlet UILabel *fiveThreeLb;
@property (weak, nonatomic) IBOutlet UIButton *fiveBtn;


@end

NS_ASSUME_NONNULL_END
