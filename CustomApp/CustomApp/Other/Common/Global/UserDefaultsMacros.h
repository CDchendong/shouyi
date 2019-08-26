
//
//  UserDefaultsMacros.h
//  AccountsManagement
//
//  Created by zhaohaohao on 2018/5/14.
//  Copyright © 2018年 eims. All rights reserved.
//

#ifndef UserDefaultsMacros_h
#define UserDefaultsMacros_h

#define kUserDefaults  [NSUserDefaults standardUserDefaults]

#define DefaultsSetObject(value,key)  [[NSUserDefaults standardUserDefaults] setObject:value forKey:key]
#define DefaultsGetObject(key)        [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define DefaultsSetInteger(value,key) [[NSUserDefaults standardUserDefaults] setInteger:value forKey:key]
#define DefaultsGetInteger(key)       [[NSUserDefaults standardUserDefaults] integerForKey:key]
#define DefaultsSetBool(value,key)    [[NSUserDefaults standardUserDefaults]setBool:value forKey:key]
#define DefaultsGetBool(key)          [[NSUserDefaults standardUserDefaults] boolForKey:key]

#define kUserModel   [UserModelManager shareInstance].userModel

#endif /* UserDefaultsMacros_h */
