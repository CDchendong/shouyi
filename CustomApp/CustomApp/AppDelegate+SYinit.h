//
//  AppDelegate+SYinit.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/5.
//  Copyright © 2019 eims. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (SYinit)
/**
 启动App的初始化操作
 */
- (void)initiIalizationAppWithOptions:(NSDictionary *)launchOptions;
@end

NS_ASSUME_NONNULL_END
