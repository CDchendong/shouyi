//
//  BaseViewVC.h
//  CustomApp
//
//  Created by CDchen on 2019/4/17.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewVC : UIViewController
#pragma mark -------导航栏
//导航栏标题
- (void)setNavTitle:(NSString *)title;
//导航栏返回
- (void)setNavBackBtn;
- (void)setNavLeftBtn:(NSString *)title image:(NSString *)imageName;
//右侧导航栏按钮
- (void)setNavRightBtn:(NSString *)title image:(NSString *)imageName;
- (void)setNavRightBtn:(NSArray *)array;
//按钮响应事件
- (void)backAction:(id)sender;
- (void)rightAction:(id)sender;
- (void)endEditing;

- (void)sy_initConfigs;
- (void)sy_bindEvents;

@end

NS_ASSUME_NONNULL_END
