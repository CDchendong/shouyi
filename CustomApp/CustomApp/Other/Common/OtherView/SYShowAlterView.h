//
//  SYShowAlterView.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/8.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, SYAlertViewContentType) {
     SYAlertViewContentTypeCenter,
     SYAlertViewContentTypeBottom
};

@interface SYShowAlterView : UIView

+ (instancetype)showAlertViewWithType:(SYAlertViewContentType)type toView:(nullable UIView *)view config:(void(^)(UIView *contentView))config;

- (void)dismissAnimated:(BOOL)animated;
- (void)dismissAnimated:(BOOL)animated dismissed:(nullable void(^)(void))dismissed;

@end

NS_ASSUME_NONNULL_END
