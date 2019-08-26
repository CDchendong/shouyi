//
//  SYShopDetailNormsView.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/8.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define kSYNormsViewHeight 390.F
@protocol didclickTitleDelegate <NSObject>

- (void)didclcikName:(NSString *)name;

@end

@interface SYShopDetailNormsView : UIView
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIView *normsView;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *stockLb;
@property (weak, nonatomic) IBOutlet UILabel *moneyLb;
@property (weak, nonatomic) IBOutlet UIButton *reduceBtn;
@property (weak, nonatomic) IBOutlet UILabel *numberLb;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *inShopBtn;
@property (weak, nonatomic) IBOutlet UIButton *buyNowBtn;

@property (nonatomic, weak)id<didclickTitleDelegate>delegate;

- (void)reloadDataSource:(NSMutableArray *)dataSource idSource:(NSMutableArray *)idData sizeCalculated:(void(^)(CGSize size))calculated;
+ (instancetype)detailNormsView;

@end

NS_ASSUME_NONNULL_END
