//
//  Macros.h
//  TestDemo
//
//  Created by 孙若淮 on 14/03/2018.
//  Copyright © 2018 Monster. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#import "AppDelegate.h"

#define kAppleID     @""//真实

/**
 *  get请求简写
 */
#define EVGetUrl(url_name,params)           [NSString stringWithFormat:@"%@%@",url_name,params]

#define EVGetUrlLine(url_name,params)           [NSString stringWithFormat:@"%@/%@",url_name,params]
//加载xib
#define NSMainBundleClass(class) [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(class) owner:self options:nil][0]

#define NSMainBundleName(name) [[NSBundle mainBundle]loadNibNamed:name owner:self options:nil][0]

// 应用程序总代理
#define AppDelegateInstance         ((AppDelegate*)([UIApplication sharedApplication].delegate))

#define BaseServerUrl  (AppDelegateInstance.baseServerUrl)

#define BaseImageUrl  @""

//设置图片
#define kImageNamed(x)  [UIImage imageNamed:x]

// 是否为3.5尺 /320 *480 iPhone4/iPhone4s
#define ThreeFiveInch ([UIScreen mainScreen].bounds.size.height == 480.0)
// 是否为4尺 /320 *568 iPhone5/iPhone5s
#define FourInch ([UIScreen mainScreen].bounds.size.height == 568.0)
// 是否为4.7尺 / 375 *667 iPhone6
#define FourSevenInch ([UIScreen mainScreen].bounds.size.height == 667.0)
// 是否为5.5尺 / 414 * 736 iPhone6 Plus
#define FiveFiveInch ([UIScreen mainScreen].bounds.size.height == 736.0)
#if TARGET_IPHONE_SIMULATOR

#define IS_DEVICE_ORIENTATION_PORTRAIT  1

#else  // TARGET_OS_IPHONE

#define IS_DEVICE_ORIENTATION_PORTRAIT  1
//#define IS_DEVICE_ORIENTATION_PORTRAIT  (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation))

#endif

#define IS_IPHONEX_SERIES_SCREEN    (IS_DEVICE_ORIENTATION_PORTRAIT ? kScreenHeight >= 812.F : kScreenWidth >= 812.F)

/// iPhone series layouts
#define IPHONE_STABAR_HEIGHT        (20.F)
#define IPHONE_NAVBAR_HEIGHT        (44.F)
#define IPHONE_TABBAR_HEIGHT        (49.F)
#define IPHONE_MARGIN_TOP           (IPHONE_STABAR_HEIGHT + IPHONE_NAVBAR_HEIGHT)
#define IPHONE_MARGIN_BOTTOM        (IPHONE_TABBAR_HEIGHT)

#define IPHONEX_STABAR_HEIGHT       (IS_DEVICE_ORIENTATION_PORTRAIT ? 44.F : 20.F)
#define IPHONEX_SAFE_AREA_TOP       (IS_DEVICE_ORIENTATION_PORTRAIT ? 44.F : 0.F)
#define IPHONEX_SAFE_AREA_BOTTOM    (IS_DEVICE_ORIENTATION_PORTRAIT ? 34.F : 0.F)
#define IPHONEX_MARGIN_TOP          (IPHONEX_SAFE_AREA_TOP    + IPHONE_NAVBAR_HEIGHT)
#define IPHONEX_MARGIN_BOTTOM       (IPHONEX_SAFE_AREA_BOTTOM + IPHONE_TABBAR_HEIGHT)

#define AUTO_IPHONE_MARGIN_TOP        (IS_IPHONEX_SERIES_SCREEN ? IPHONEX_MARGIN_TOP : IPHONE_MARGIN_TOP)
#define AUTO_IPHONE_MARGIN_BOTTOM     (IS_IPHONEX_SERIES_SCREEN ? IPHONEX_MARGIN_BOTTOM : IPHONE_MARGIN_BOTTOM)
#define AUTO_IPHONE_SAFE_AREA_TOP     (IS_IPHONEX_SERIES_SCREEN ? IPHONEX_SAFE_AREA_TOP : 0.F)
#define AUTO_IPHONE_SAFE_AREA_BOTTOM  (IS_IPHONEX_SERIES_SCREEN ? IPHONEX_SAFE_AREA_BOTTOM : 0.F)
#define AUTO_IPHONE_STABAR_HEIGHT     (IS_IPHONEX_SERIES_SCREEN ? IPHONEX_STABAR_HEIGHT : IPHONE_STABAR_HEIGHT)

#define AUTO_SCALE_WIDTH_RATIO          (kScreenWidth  / SCREEN_DESIGN_WIDTH)
#define AUTO_SCALE_HEIGHT_RATIO         (AUTO_SCALE_WIDTH_RATIO)
#define AUTO_SCALE_WIDTH(width)         (AUTO_SCALE_WIDTH_RATIO  * width)
#define AUTO_SCALE_HEIGHT(height)       (AUTO_SCALE_HEIGHT_RATIO * height)
#define AUTO_SCALE_FONT(font)           (AUTO_SCALE_WIDTH_RATIO  * font)

// 判断是否iPhone设备或者iPhone 模拟器
#define IS_IPHONE                                  ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone" ] || [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone Simulator" ])
// 判断是否iPOD
#define IS_IPOD                                    ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPod touch" ] )

// 判断是否iPad
#define is_PAD                                       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


/****************************************打印控制***************************************/

#ifndef __OPTIMIZE__    //测试阶段
#define NSLog(...) NSLog(__VA_ARGS__)
#else   //发布阶段
#define NSLog(...){}
#endif

// 屏幕的高度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
// 屏幕的宽度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

// 应用主窗口
#define kKeyWindow [UIApplication sharedApplication].keyWindow

/**UITabBar高度*/
#define kTabBarHeight  ( (IPHONEX)?83:49 )
/** Bar 的高度*/
#define kNavBarHeight   ( (IPHONEX)?88:64)
/** StatusBar 的高度*/
//#define kStatusHeight   ( (IPHONEX)?44:(SYSTEM_VERSION>=11.0?20:0))
#define kStatusHeight   ((IPHONEX)?44:20)

/** Bar 的高度*/
#define kSecrityHeight  ( (IPHONEX)?34:0 )

// =====================================================================

#define BLOCK_EXEC(block, ...) if (block) block(__VA_ARGS__)

#define WEAKSELF typeof(self) __weak weakSelf = self
#define WeakSelf(type)        __weak typeof(type) weak##type = type;
#define StrongSelf(type)      __strong typeof(type) type = weak##type;

#define MD5_KEY     @""

#define DES3_KEY    @""
#define DES3_IV     @""

//======================================================================


// iPhone 6,iPhone 6Plus适配等比放大控件
#define Size(x) ((x)*MIN(kScreenWidth,kScreenHeight)/375.0f)

///度数
#define pi 3.14159265359

#define DEGREES_TO_RADIANS(degress) ((pi * degress)/180)


//判断iPhoneX
#define IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)]  ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1125,2436)) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define    kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define    kStatusBar_Height kDevice_Is_iPhoneX?44:20
#define    kTableView_Height kDevice_Is_iPhoneX?88:64

//BLOCK_EXEC
#define BLOCK_EXEC(block, ...) if (block) block(__VA_ARGS__)

// 弱引用
#define WEAKSELF typeof(self) __weak weakSelf = self
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelf(type)  __strong typeof(type) type = weak##type;



//快速定义ell

#define YM_CELLIDENTIFIER(cell)  [NSString stringWithFormat:@"%@identify",[cell class]]

#define CELL_DEFINE(CellClass, ...)     \
CellClass *cell = [tableView dequeueReusableCellWithIdentifier:YM_CELLIDENTIFIER(CellClass)];   \
if (!cell) {            \
cell = [[CellClass alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:YM_CELLIDENTIFIER(CellClass)];  \
cell.selectionStyle = UITableViewCellSelectionStyleNone;    \
__VA_ARGS__                                                 \
}

#define KOrderVCSegmentBarHeight  Size(36)

/**
 是否登录
 */
#define kIsLogin     [UserModelManager shareInstance].isLoginStatus


#endif /* Macros_h */
