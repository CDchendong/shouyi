//
//  SYCodeBtn.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/6.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYCodeBtn : UIButton

@property (nonatomic, strong) IBInspectable UIColor *restTitleColor;
@property (nonatomic, strong) IBInspectable UIColor *restBgColor;

@property (nonatomic, strong) IBInspectable UIColor *workTitleColor;
@property (nonatomic, strong) IBInspectable UIColor *workBgColor;

- (void)resume;
- (void)cancel;
@end

NS_ASSUME_NONNULL_END
