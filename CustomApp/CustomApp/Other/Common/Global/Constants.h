//
//  Constants.h
//  CanYou
//
//  Created by zhaohaohao on 2018/12/17.
//  Copyright © 2018年 e. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

/**
 订单类型
 */
typedef NS_ENUM(NSInteger,OrderStatus) {
    
    OrderStatusWaitPay = 1,//待付款
    OrderStatusWaitReceiveOrder = 2,//待接单
    OrderStatusWaitDeliverGoods = 3,//待发货
    OrderStatusWaitConfirm = 4,//待确认
    OrderStatusWaitEvaluation = 5,//待评价
    OrderStatusHadFinishOrder = 6,//已完成
    OrderStatusUserHadCancel = 7,//已取消
    OrderStatusBusinessesClosed = 8,//已关闭
    OrderStatusRefunding = 9,//退款中
    OrderStatusRefundFinished = 10//退款完成
};
/**
 付款类型
 */
typedef NS_ENUM(NSInteger,PayMethod) {
    
    PayMethodYuEPay = 1,//余额支付
    PayMethodZhiFuBaoPay = 2,//支付宝支付
    PayMethodWeiXinPay = 3,//微信支付
    PayMethodYinLianPay = 4,//银联支付
    PayMethodOffline = 5//线下支付
    
};
typedef NS_ENUM(NSInteger ,ActivityDetailVCIntoType) {
    ActivityDetailVCIntoTypeAdd,
    ActivityDetailVCIntoTypeModify
};
@end
