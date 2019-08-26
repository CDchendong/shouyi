//
//  NSBundle+EVNetworking.h
//  AAAAFNetworking
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (EVNetworking)

+ (instancetype)ev_mainBundle;
+ (NSString *)ev_localizedStringForKey:(NSString *)key defaultValue:(NSString *)defaultValue;
+ (NSString *)ev_localizedStringForKey:(NSString *)key;

@end
