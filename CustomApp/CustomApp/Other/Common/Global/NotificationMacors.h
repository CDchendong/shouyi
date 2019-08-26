

//
//  NotificationMacors.h
//  TestDemo
//
//  Created by zhaohaohao on 2018/8/9.
//  Copyright © 2018年 Monster. All rights reserved.
//

#ifndef NotificationMacors_h
#define NotificationMacors_h

/**
 添加通知
 */
#define NOTIF_ADD(n, f)     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(f) name:n object:nil]

/**
 发送通知
 */
#define NOTIF_POST(n, u)    [[NSNotificationCenter defaultCenter] postNotificationName:n object:nil userInfo:u]

/**
 移除通知
 */
#define NOTIF_REMV()        [[NSNotificationCenter defaultCenter] removeObserver:self]

//微信支付结果通知
#define kWxPayResultNotification @"WxPayResultNotification"

//微信登录后结果通知
#define kWxDidLoginNotification @"WechatDidLoginNotification"

//支付宝支付结果通知
#define kAliPayResultNotification @"AliPayResultNotification"

////支付宝支付失败通知
//#define kAliPayFailNotification @"AliPayFailNotification"

//点击tabbar通知
#define kDidSelectSecondTabBarNotification @"DidSelectSecondTabBarNotification"


#endif /* NotificationMacors_h */
