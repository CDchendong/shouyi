//
//  AppDelegate+SYinit.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/5.
//  Copyright © 2019 eims. All rights reserved.
//

#import "AppDelegate+SYinit.h"
#import "AppDelegate+ThirdConfigs.h"

@implementation AppDelegate (SYinit)
- (void)initiIalizationAppWithOptions:(NSDictionary *)launchOptions {
    [self sy_loadIQKeyboardMangerConfigs];
}
@end
