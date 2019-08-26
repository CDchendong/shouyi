//
//  NSBundle+EVNetworking.m
//  AAAAFNetworking
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "NSBundle+EVNetworking.h"

@implementation NSBundle (EVNetworking)

+ (instancetype)ev_mainBundle {
    static NSBundle *mainBundle = nil;
    if (mainBundle == nil) {
        mainBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"EVNetworking" ofType:@"bundle"]];
    }
    return mainBundle;
}

+ (NSString *)ev_localizedStringForKey:(NSString *)key {
    return [self ev_localizedStringForKey:key defaultValue:nil];
}

+ (NSString *)ev_localizedStringForKey:(NSString *)key defaultValue:(NSString *)defaultValue {
    static NSBundle *bundle = nil;
    if (bundle == nil) {
        // （iOS获取的语言字符串比较不稳定）目前框架只处理en、zh-Hans、zh-Hant三种情况，其他按照系统默认处理
        NSString *language = [NSLocale preferredLanguages].firstObject;
        if ([language hasPrefix:@"en"]) {
            language = @"en";
        } else if ([language hasPrefix:@"zh"]) {
            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
                language = @"zh-Hans"; // 简体中文
            } else { // zh-Hant\zh-HK\zh-TW
                language = @"zh-Hant"; // 繁體中文
            }
        } else {
            language = @"en";
        }
        
        // 从MJRefresh.bundle中查找资源
        bundle = [NSBundle bundleWithPath:[[NSBundle ev_mainBundle] pathForResource:language ofType:@"lproj"]];
    }
    defaultValue = [bundle localizedStringForKey:key value:defaultValue table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:defaultValue table:nil];
}

@end
