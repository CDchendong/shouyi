//
//  HUD.h
//  yidianjiankang
//
//  Created by 孙若淮(SUNRUOHUAI135) on 17/2/23.
//  Copyright © 2017年 Monster. All rights reserved.
//

#import "MBProgressHUD.h"
/*菊花*/
@interface HUD : MBProgressHUD

/**
 *  隐藏 HUD
 */
+ (void) dissmissShowView:(UIView *)showView;

/**
 *  显示 HUD
 *
 *  iamgeArr 为 loading 图片数组，如果为nil 则为默认的loading样式
 */
+ (instancetype) showHUDWithImageArr:(NSMutableArray *)imageArr andShowView:(UIView *)showView;
/**
 *  显示成功
 *
 *  @param showView showView description
 *  @param title    title description
 */
+ (instancetype) showHUDSuccess:(UIView*)showView title:(NSString*)title;

/**
 *  显示失败
 *
 *  @param showView showView description
 *  @param title    title description
 */
+ (instancetype)showHUDError:(UIView *)showView title:(NSString *)title;


+ (instancetype)showLoading;
+ (void)dismissLoading;

@end
