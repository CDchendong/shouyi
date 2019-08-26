//
//  FontMacros.h
//  ServerPeople
//
//  Created by zhaohaohao on 2017/11/16.
//  Copyright © 2017年 zenith. All rights reserved.
//

#ifndef FontMacros_h
#define FontMacros_h


//字体
#define kScale 0.5

#define kFont(x)     [UIFont systemFontOfSize:x]

#define kfontWithSiez(x)     [UIFont systemFontOfSize:x]

#define kBoldSystemFontOf(x) [UIFont fontWithName:@"PingFang-SC-Bold" size:x]

#define kHeavySystemFontOf(x) [UIFont fontWithName:@"PingFang-SC-Heavy" size:x]

#define kMediumSystemFontOf(x) [UIFont fontWithName:@"PingFang-SC-Medium" size:x]


//加粗
#define kBFont(x)          [UIFont boldSystemFontOfSize:(x * kScale)]

//正常的字体高度
#define kHFont(x)    [PublicTool heightWithString:@"*" font:kFont(x)]

//加粗的字体高度
#define kHBFont(x)    [PublicTool heightWithString:@"*" font:kBFont(x)]



#endif /* FontMacros_h */
