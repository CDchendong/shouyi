//
//  SYSearchTextField.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/6.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYSearchTextField : UITextField

@property (nonatomic, copy) UIColor *logoColor;

@property (nonatomic, copy) void(^searchBlock)(NSString *keyword);

@property (nonatomic, copy) void(^clickSeachBlock)(void);
@end

NS_ASSUME_NONNULL_END
