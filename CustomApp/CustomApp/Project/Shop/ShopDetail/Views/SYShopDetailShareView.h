//
//  SYShopDetailShareView.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/16.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define kSYShareViewHeight 170.F

@interface SYShopDetailShareView : UIView
+ (instancetype)shareView;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@end

NS_ASSUME_NONNULL_END
