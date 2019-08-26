//
//  SYShopDetailCBottomView.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/16.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYShopDetailCBottomView : UIView
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *praiseBtn;
+ (instancetype)commentBottomView;
@end

NS_ASSUME_NONNULL_END
