//
//  BaseModel.h
//  TestDemo
//
//  Created by 孙若淮 on 14/03/2018.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface BaseRequestResModel : NSObject
/**
 请求返回信息（非数据）
 */
@property (nonatomic , copy) NSString * message;

/**
 请求返回信息（非数据）
 */
@property (nonatomic , copy) NSString * msg;


/**
 请求返回状态
 200：正常
 -99 ： 需要登录、或者账号被禁用等
 -98 ： 系统暂停使用
 -97 ： 权限被禁用
 -1 ：  常规错误，接口调用失败

 */
@property (nonatomic , assign) NSInteger status;
/**
 请求返回状态
 1：正常
 */
@property (nonatomic , assign) NSInteger type;

/**
 请求返回状态
 200：正常
-500：错误
 */
@property (nonatomic , assign) NSInteger code;

@end
