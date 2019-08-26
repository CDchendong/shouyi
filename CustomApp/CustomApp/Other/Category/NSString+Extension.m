//
//  NSString+Extension.m
//  CustomApp
//
//  Created by CDchen on 2019/4/17.
//  Copyright © 2019 eims. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (Extension)
// 字符串保留两位小数
+ (NSString *)ym_priceWithSign:(CGFloat)value {
    
    return [NSString stringWithFormat:@"￥%.2f", value];
}

// 把手机号第4-7位变成星号
+ (NSString *)ym_phoneNumToAsterisk:(NSString*)phoneNum {
    
    if (!phoneNum.length) {
        
        return @"";
    }
    return [phoneNum stringByReplacingCharactersInRange:NSMakeRange(3,4) withString:@"****"];
}

// 把邮箱@前面变成星号
+ (NSString*)ym_emailToAsterisk:(NSString *)email {
    
    NSArray *arr = [email componentsSeparatedByString:@"@"];
    NSString *str = [arr objectAtIndex:0];
    return [email stringByReplacingCharactersInRange:NSMakeRange(str.length, email.length-str.length) withString:@"****"];
}

// 把身份证号第11-14位变成星号
+ (NSString*)ym_idCardToAsterisk:(NSString *)idCardNum {
    
    return [idCardNum stringByReplacingCharactersInRange:NSMakeRange(10, 4) withString:@"****"];
}

//几分钟前的更新
+ (NSString *)ym_beforeUpdateTime: (NSString *)theDate {
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=now-late;
    if (cha/3600<1) {
        
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        
        if (timeString.integerValue<3) {
            timeString=@"刚刚";
        }else{
            timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
        }
        
    }
    if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    }
    if (cha/86400>1 && cha/(86400*30)<1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    }
    if (cha/(86400*30)>1 && cha/(86400*365)<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/(86400*30)];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@月前", timeString];
    }
    if (cha/(86400*365)>1) {
        timeString = [NSString stringWithFormat:@"%f", cha/(86400*365)];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@年前", timeString];
    }
    
    return timeString;
}

// 获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)ym_firstCharactor:(NSString *)aString {
    
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}

// 通过文本宽度计算高度
- (CGSize)ym_calculateSize:(UIFont *)font maxWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing {
    
    CGSize size = CGSizeMake(width,MAXFLOAT);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.paragraphSpacing = lineSpacing;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGRect rect =  [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return CGSizeMake(rect.size.width, rect.size.height);
}
/**
 *   计算字符串显示区域
 */
- (CGSize)sizeInSize:(CGSize)size andFont:(UIFont *)font
{
    if (self.length == 0)
    {
        return CGSizeZero;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.hyphenationFactor = 0.0f;
    paragraphStyle.firstLineHeadIndent = 0.0f;
    paragraphStyle.paragraphSpacing = 0.0f;
    paragraphStyle.headIndent = 0.0f;
    paragraphStyle.lineSpacing = 0.0f;
    
    NSDictionary *attributes = @{NSFontAttributeName : font,
                                 NSParagraphStyleAttributeName : paragraphStyle};
    
    CGSize newSize = [self boundingRectWithSize:size options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes:attributes context:nil].size;
    
    return CGSizeMake(((NSInteger)newSize.width + 1), ((NSInteger)newSize.height + 1));
}
- (CGSize)stringSizeWithContentSize:(CGSize)contentSize font:(UIFont *)font
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: font,NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize size = [self boundingRectWithSize:contentSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;
}

// 获取一个字体的长度
- (CGFloat)ym_getStringWidthfont:(UIFont*)font {
    
    return [self sizeWithAttributes:@{NSFontAttributeName:font}].width;
}

#pragma mark - 字符串检验

// 验证身份证是否合法
+ (BOOL)ym_validateIdCard:(NSString *)idCard {
    
    NSMutableArray *IDArray = [NSMutableArray array];
    // 遍历身份证字符串,存入数组中
    for (int i = 0; i < 18; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [idCard substringWithRange:range];
        [IDArray addObject:subString];
    }
    // 系数数组
    NSArray *coefficientArray = [NSArray arrayWithObjects:@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2", nil];
    // 余数数组
    NSArray *remainderArray = [NSArray arrayWithObjects:@"1", @"0", @"X", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2", nil];
    // 每一位身份证号码和对应系数相乘之后相加所得的和
    int sum = 0;
    for (int i = 0; i < 17; i++) {
        int coefficient = [coefficientArray[i] intValue];
        int ID = [IDArray[i] intValue];
        sum += coefficient * ID;
    }
    // 这个和除以11的余数对应的数
    NSString *str = remainderArray[(sum % 11)];
    // 身份证号码最后一位
    NSString *string = [idCard substringFromIndex:17];
    // 如果这个数字和身份证最后一位相同,则符合国家标准,返回YES
    if ([str isEqualToString:string]) {
        return YES;
    } else {
        return NO;
    }
}

// 邮箱验证
+ (BOOL)ym_validateEmail:(NSString *)email {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

// 手机号码验证
+ (BOOL)ym_validateMobile:(NSString *)mobile {
    
    // 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
    //    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSString *phoneRegex =  @"^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$";
    
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

// 固话验证
+ (BOOL)ym_validateAreaTel:(NSString *)areaTel {
    
    NSString *phoneRegex = @"^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:areaTel];
    
}

// 判断字符串是否有中文
+ (BOOL)ym_IsChinese:(NSString *)str {
    
    for(int i=0; i< [str length];i++) {
        
        int a = [str characterAtIndex:i];
        
        if( a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}

// 验证证件号码格式错误
+ (BOOL)ym_isPaperFormat:(NSString *) paparworkType  cerId: (NSString*) code {
    
    
    if (paparworkType == nil || [paparworkType length]==0) {
        return NO;
    }
    
    
    BOOL isFormat = NO;
    NSInteger type = [paparworkType integerValue];
    
    switch (type){
        case 39:
            //身份证
            isFormat = [self ym_validateIdCard:code];
            
            break;
        case 43:
            //港澳通行证
            //isFormat = isHKPassport(code);
            //"[HMhm]{1}([0-9]{10}|[0-9]{8})";
            isFormat = [self validatePass:code];
            break;
        case 40:
            //护照
            //"[a-zA-Z]{5,17}" or "[a-zA-Z0-9]{5,17}"
            
            isFormat = [self validateHuZhao:code];
            break;
            
        case 44:
            /**台湾通行证**/
            //"[0-9]{8}" or "[0-9]{10}"
            //isFormat = [self ym_validateTaiWanPass:code];
            break;
            
        default:
            isFormat = true;
            break;
    }
    
    return isFormat;
}

//港澳通行证
+ (BOOL)validatePass:(NSString *)passCode {
    
    NSString *codeRegex = @"[HMhm]{1}([0-9]{10}|[0-9]{8})";
    NSPredicate *codeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",codeRegex];
    
    return [codeTest evaluateWithObject:passCode];
    
}

//护照
+ (BOOL)validateHuZhao:(NSString *)huZhaoCode {
    
    NSString *codeRegex = @"[a-zA-Z]{5,17}";
    NSPredicate *codeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",codeRegex];
    
    NSString *codeRegex2 = @"[a-zA-Z0-9]{5,17}";
    NSPredicate *codeTest2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",codeRegex2];
    
    
    return [codeTest evaluateWithObject:huZhaoCode]||[codeTest2 evaluateWithObject:huZhaoCode];
    
}

// 重写containsString方法，兼容8.0以下版本
- (BOOL)containsString:(NSString *)aString NS_AVAILABLE(10_10, 8_0) {
    if ([aString ym_isBlank]) {
        return NO;
    }
    if ([self rangeOfString:aString].location != NSNotFound) {
        return YES;
    }
    return NO;
}

// 判断字符串是否为空白的
- (BOOL)ym_isBlank {
    
    if ((self == nil) || (self.length == 0)) {
        return YES;
    }
    
    NSString *trimedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([trimedString length] == 0) {
        return YES;
    } else {
        return NO;
    }
    
    return YES;
}

#pragma mark - 字符串相关转换

// 字典转换成字符串
+ (NSString *)ym_jsonStringWithDictionary:(NSDictionary *)dictionary {
    
    NSString *jsonString = nil;
    NSError *error;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error: &error];
    
    if (!data) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    return jsonString;
}

// 数组转JSON
+ (NSString *)ym_arrayToJSONString:(NSArray *)array {
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

// 过滤表情或者一些文字
+ (NSString *)ym_filtration_emoji:(NSString *)text {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    return modifiedString;
}

// 将数组里每个字符串用","号拼接成一个字符串
- (NSString *)ym_componentString:(NSArray *)array {
    NSString *str = [array componentsJoinedByString:@","];
    return str;
}

// 给字符串md5加密
- (NSString*)ym_md5 {
    
    const char *ptr = [self UTF8String];
    
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, (CC_LONG)strlen(ptr), md5Buffer);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}
#pragma mark - 32位 小写
+(NSString *)MD5ForLower32Bate:(NSString *)str{ //要进行UTF8的转码
    
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
        
    }
    return digest;
    
}
#pragma mark - 32位 大写
+(NSString *)MD5ForUpper32Bate:(NSString *)str{ //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
        
    }
    return digest;
}
#pragma mark - 16位 大写
+(NSString *)MD5ForUpper16Bate:(NSString *)str{
    NSString *md5Str = [self MD5ForUpper32Bate:str];
    NSString *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
        
    }
    return string;
}
#pragma mark - 16位 小写
+(NSString *)MD5ForLower16Bate:(NSString *)str{
    NSString *md5Str = [self MD5ForLower32Bate:str];
    NSString *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
        
    }
    return string;
}
//针对后台返回 2018-03-21T00:00:00.0 格式的字符转日期格式
-(NSString *)dateStringFormateWith:(NSString *)formate{
    NSString * str = self;
    if ([formate isEqualToString:@"年月日"]) {
        NSArray *date = [self componentsSeparatedByString:@"T"];
        NSArray *dateArr = [date[0] componentsSeparatedByString:@"-"];
        NSArray *timeArr = [date[1] componentsSeparatedByString:@"."];
        str = [NSString stringWithFormat:@"%@年%@月%@日 %@",dateArr[0],dateArr[1],dateArr[2],timeArr[0]];
    }
    if ([formate isEqualToString:@"//"]) {
        NSArray *date = [self componentsSeparatedByString:@"T"];
        NSArray *dateArr = [date[0] componentsSeparatedByString:@"-"];
        NSArray *timeArr = [date[1] componentsSeparatedByString:@"."];
        str = [NSString stringWithFormat:@"%@/%@/%@ %@",dateArr[0],dateArr[1],dateArr[2],timeArr[0]];
    }
    return str;
}

- (NSURL *)ym_imageurl {
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BaseImageUrl, self]];
}

+(NSString *)ym_stringUtils:(id)stringValue
{
    NSString *string = [NSString stringWithFormat:@"%@", stringValue];
    
    if([string isEqualToString:@"<null>"])
    {
        string = @"";
    }
    
    if(string == nil)
    {
        string = @"";
    }
    
    if([string isEqualToString:@"(null)"])
    {
        string = @"";
    }
    
    if(string.length == 0)
    {
        string = @"";
    }
    
    return string;
}

- (BOOL)isBlankString{
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (NSString *)handelRef:(NSString *)ref path:(NSString *)path{
    if (ref.length <= 0 && path.length <= 0) {
        return nil;
    }
    
    NSMutableString *result = [NSMutableString new];
    if (ref.length > 0) {
        [result appendString:ref];
    }
    if (path.length > 0) {
        [result appendFormat:@"%@%@", ref.length > 0? @"/": @"", path];
    }
    return [result stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (int)checkIsHaveNumAndLetter
{
    return [NSString checkIsHaveNumAndLetter:self];
}


/**
 * 判断字符串中包含数字和字母的几种情况
 */
+ (int)checkIsHaveNumAndLetter:(NSString*)password{
    
    //数字条件
    
    NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    
    
    //符合数字条件的有几个字节
    
    NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:password
                                 
                                                                       options:NSMatchingReportProgress
                                 
                                                                         range:NSMakeRange(0, password.length)];
    
    
    
    //英文字条件
    
    NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    
    
    //符合英文字条件的有几个字节
    
    NSUInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:password options:NSMatchingReportProgress range:NSMakeRange(0, password.length)];
    
    
    
    if (tNumMatchCount == password.length) {
        
        //全部符合数字，表示沒有英文
        
        return 1;
        
    } else if (tLetterMatchCount == password.length) {
        
        //全部符合英文，表示沒有数字
        
        return 2;
        
    } else if (tNumMatchCount + tLetterMatchCount == password.length) {
        
        //符合英文和符合数字条件的相加等于密码长度
        
        return 3;
        
    } else {
        
        return 4;
        
        //可能包含标点符号的情況，或是包含非英文的文字，这里再依照需求详细判断想呈现的错误
        
    }
    
}

/**将num转成字符串*/
+ (NSString *)fromNum:(NSInteger)num
{
    return [NSString stringWithFormat:@"%ld",(long)num];
}
//字符串拼接
- (NSString *)joinStr:(NSString *)str
{
    return [NSString stringWithFormat:@"%@%@",self,str];
}

//  判断是否以字母开头
+ (BOOL)isEnglishFirst:(NSString *)str {
    NSString *regular = @"^[A-Za-z].+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
    
    if ([predicate evaluateWithObject:str] == YES){
        return YES;
    }else{
        return NO;
    }
}



/**
 将 后台返回的 “Jun 1, 2018 12:00:00 AM"字符串
 转换为   NSDate对象
 */
+ (NSDate *)getChineseDateWithOriginalDateString:(NSString *)originalDateString{
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM d, yyyy hh:mm:ss aa"];
    //使用en_US才可识别缩写月份
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    NSDate *timeDate0 = [dateFormatter dateFromString:originalDateString];
    NSDate *timeDate1 = [self convertToChineseDateWithWorldDate:timeDate0];
    return timeDate1;
    
}
/**
 将世界日期date转变成中国时间date
 */
+ (NSDate *)convertToChineseDateWithWorldDate:(NSDate *)worldDate{
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: worldDate];
    NSDate *chineseDate = [worldDate  dateByAddingTimeInterval: interval];
    return chineseDate;
}

@end
