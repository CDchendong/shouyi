
//
//  Color.h
//  CanYou
//
//  Created by zhaohaohao on 2018/10/23.
//  Copyright © 2018年 e. All rights reserved.
//

#ifndef Color_h
#define Color_h

// RGB颜色
#define RGBCOLOR(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define rgb(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define RGBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define rgba(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

// HEX颜色
#define HEXRGBCOLOR(h)      RGBCOLOR(((h>>16)&0xFF), ((h>>8)&0xFF), (h&0xFF))
#define HEXRGBACOLOR(h,a)   RGBACOLOR(((h>>16)&0xFF), ((h>>8)&0xFF), (h&0xFF), a)
#define HexColor(hexString)  [UIColor colorWithHexString:hexString]
#define COLOR_HEXS(value) [UIColor colorWithHexString:value]
#define COLOR_HEXSA(value, alpha) [[UIColor colorWithHexString:value] colorWithAlphaComponent:alpha]
#endif /* Color_h */
