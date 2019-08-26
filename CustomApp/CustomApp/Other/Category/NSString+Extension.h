//
//  NSString+Extension.h
//  CustomApp
//
//  Created by CDchen on 2019/4/17.
//  Copyright © 2019 eims. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)
/*
 *字符串保留两位小数
 */
+(NSString *)ym_priceWithSign:(CGFloat)value;

/**
 把手机号第4-7位变成星号
 */
+(NSString *)ym_phoneNumToAsterisk:(NSString*)phoneNum;

/**
 把邮箱@前面变成星号
 */
+(NSString*)ym_emailToAsterisk:(NSString *)email;

/**
 把身份证号第11-14位变成星号
 */
+(NSString *)ym_idCardToAsterisk:(NSString *)idCardNum;

/**
 几分钟前更新的内容
 */
+(NSString *)ym_beforeUpdateTime: (NSString *) theDate;

/**
 获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
 */
+(NSString *)ym_firstCharactor:(NSString *)aString;

/**
 通过文本宽度计算高度
 */
-(CGSize)ym_calculateSize:(UIFont *)font maxWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;
/**
 *   计算字符串显示区域
 */
- (CGSize)sizeInSize:(CGSize)size andFont:(UIFont *)font;

- (CGSize)stringSizeWithContentSize:(CGSize)contentSize font:(UIFont *)font;
/**
 获取一个字体的长度
 */
-(CGFloat)ym_getStringWidthfont:(UIFont*)font;

#pragma mark - 字符串检验
/**
 判断是否是身份证号码
 */
+(BOOL)ym_validateIdCard:(NSString *)idCard;

/**
 邮箱验证
 */
+(BOOL)ym_validateEmail:(NSString *)email;

/**
 手机号码验证
 */
+(BOOL)ym_validateMobile:(NSString *)mobile;

/**
 固话验证
 */
+(BOOL)ym_validateAreaTel:(NSString *)areaTel;

/**
 判断字符串是否有中文
 */
+(BOOL)ym_IsChinese:(NSString *)str;

/**
 * 验证证件号码格式错误
 *
 * @param paparworkType  证件类型:(身份证39, 护照40, 台胞通行证41, 回乡证42, 港澳通行证43, 台湾通行证44, 户口本45, 出生证明46, 其他47)
 * @param code 证件内容
 */
+(BOOL)ym_isPaperFormat:(NSString *)paparworkType  cerId:(NSString *)code;

/**
 重写containsString方法，兼容8.0以下版本
 */
-(BOOL)containsString:(NSString *)aString NS_AVAILABLE(10_10, 8_0);

/**
 判断字符串是否为空白的
 */
-(BOOL)ym_isBlank;

#pragma mark - 字符串相关转换

/**
 字典转换成字符串
 */
+(NSString *)ym_jsonStringWithDictionary:(NSDictionary *)dictionary;

/**
 数组转JSON
 */
+(NSString *)ym_arrayToJSONString:(NSArray *)array;

/**
 过滤表情或者一些文字
 */
+(NSString *)ym_filtration_emoji:(NSString *)text;

/**
 将数组里每个字符串用","号拼接成一个字符串
 */
-(NSString *)ym_componentString:(NSArray *)array;

/*
 * 给字符串md5加密
 */
-(NSString *)ym_md5;

/**
 拼接网络地址字符串
 */
- (NSURL *)ym_imageurl;

/*
 * 返回非空字符串
 */
+(NSString *)ym_stringUtils:(id)stringValue;


//32位小写
+(NSString *)MD5ForLower32Bate:(NSString *)str;
// 32位大写
+(NSString *)MD5ForUpper32Bate:(NSString *)str;
// 16为大写
+(NSString *)MD5ForUpper16Bate:(NSString *)str;
// 16位小写
+(NSString *)MD5ForLower16Bate:(NSString *)str;

//针对后台返回 2018-03-21T00:00:00.0 格式的字符转日期格式
-(NSString *)dateStringFormateWith:(NSString *)formate;

- (BOOL)isBlankString;

//判断字符串中包含数字和字母的几种情况
/*  返回值说明:
 *  1:表示全部符合数字，沒有英文
 *  2:表示全部符合英文，沒有数字
 *  3:表示符合英文和符合数字条件的相加等于密码长度
 */
- (int)checkIsHaveNumAndLetter;
+ (int)checkIsHaveNumAndLetter:(NSString*)password;

/**将num转成字符串*/
+ (NSString *)fromNum:(NSInteger)num;
/**连接后面字符*/
- (NSString *)joinStr:(NSString *)str;

//  判断是否以字母开头
+ (BOOL)isEnglishFirst:(NSString *)str;





/**
 将 后台返回的 “Jun 1, 2018 12:00:00 AM"字符串
 转换为   NSDate对象
 */
+ (NSDate *)getChineseDateWithOriginalDateString:(NSString *)originalDateString;
@end

NS_ASSUME_NONNULL_END
