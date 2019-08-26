
#import <Foundation/Foundation.h>

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

#define kNSDateUtilitiesFormatFullDateWithTime     @"MMM d, yyyy h:mm a"
#define  kNSDateUtilitiesFormatFullDate             @"MMM d, yyyy"
#define  kNSDateUtilitiesFormatShortDateWithTime    @"MMM d h:mm a"
#define  kNSDateUtilitiesFormatShortDate            @"MMM d"
#define  kNSDateUtilitiesFormatWeekday              @"EEEE"
#define  kNSDateUtilitiesFormatWeekdayWithTime      @"EEEE h:mm a"
#define  kNSDateUtilitiesFormatTime                 @"HH:mm"
#define  kNSDateUtilitiesFormatTimeWithPrefix       @"'at' h:mm a"
#define  kNSDateUtilitiesFormatSQLDate              @"yyyy-MM-dd"
#define  kNSDateUtilitiesFormatSQLTime              @"HH:mm:ss"
#define  kNSDateUtilitiesFormatSQLDateWithTime     @"yyyy-MM-dd HH:mm:ss"


@interface NSDate (Utilities)


/**
 获取当前的时间
 */
+(NSString *)getYearAndMonth:(NSString *)date;
/**
 获取当前的时间,，返回NSDate
 */
+(NSDate *)getCurreDate:(NSString *)str;


+ (NSCalendar *) currentCalendar; // avoid bottlenecks

/** 相对于现在，明天的日期 */
+ (NSDate *) dateTomorrow;

/** 获取今天的日期 yyyy-MM-dd HH:mm:ss **/
+ (NSString *) dateTodayString;

/**
 获取今天的日期

 @param string 格式
 */
+ (NSString *) dateTodayString:(NSString *)string;

/** 获取明天的日期 yyyy-MM-dd **/
+ (NSString *) dateTomorrowString;

/** 相对于现在，昨天的日期 */
+ (NSDate *) dateYesterday;

 /** 相对于现在 days 天后的日期 */
+ (NSDate *) dateWithDaysFromNow: (NSInteger) days;

 /** 相对于现在 days 天前的日期 */
+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days;

 /** 相对于现在 dHours 小时后的日期 */
+ (NSDate *) dateWithHoursFromNow: (NSInteger) dHours;

 /** 相对于现在 dHours 小时前的日期 */
+ (NSDate *) dateWithHoursBeforeNow: (NSInteger) dHours;

 /** 相对于现在 dMinutes 分钟后的日期 */
+ (NSDate *) dateWithMinutesFromNow: (NSInteger) dMinutes;

 /** 相对于现在 dMinutes 分钟前的日期 */
+ (NSDate *) dateWithMinutesBeforeNow: (NSInteger) dMinutes;

 /** 获取两个日期之间的时间差(天) **/
+ (NSInteger) getDayBetweenWithDateOne:(NSDate *) dateOne  withdateTwo: (NSDate *) dateTwo;

/** 忽略时间对日期比较 */
- (BOOL) isEqualToDateIgnoringTime: (NSDate *) aDate;

// Short string utilities
- (NSString *) stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle;

- (NSString *) stringWithFormat: (NSString *) format;

@property (nonatomic, readonly) NSString *shortString;

@property (nonatomic, readonly) NSString *shortDateString;

@property (nonatomic, readonly) NSString *shortTimeString;

@property (nonatomic, readonly) NSString *mediumString;

@property (nonatomic, readonly) NSString *mediumDateString;

@property (nonatomic, readonly) NSString *mediumTimeString;

@property (nonatomic, readonly) NSString *longString;

@property (nonatomic, readonly) NSString *longDateString;

@property (nonatomic, readonly) NSString *longTimeString;

- (BOOL) isToday;
- (BOOL) isTomorrow;
- (BOOL) isYesterday;

- (BOOL) isSameWeekAsDate: (NSDate *) aDate;
- (BOOL) isThisWeek;
- (BOOL) isNextWeek;
- (BOOL) isLastWeek;

- (BOOL) isSameMonthAsDate: (NSDate *) aDate;
- (BOOL) isThisMonth;
- (BOOL) isNextMonth;
- (BOOL) isLastMonth;

- (BOOL) isSameYearAsDate: (NSDate *) aDate;
- (BOOL) isThisYear;
- (BOOL) isNextYear;
- (BOOL) isLastYear;

- (BOOL) isEarlierThanDate: (NSDate *) aDate;
- (BOOL) isLaterThanDate: (NSDate *) aDate;

- (BOOL) isInFuture;
- (BOOL) isInPast;

// Date roles
- (BOOL) isTypicallyWorkday;
- (BOOL) isTypicallyWeekend;

// Adjusting dates
- (NSDate *) dateByAddingYears: (NSInteger) dYears;
- (NSDate *) dateBySubtractingYears: (NSInteger) dYears;
- (NSDate *) dateByAddingMonths: (NSInteger) dMonths;
- (NSDate *) dateBySubtractingMonths: (NSInteger) dMonths;
- (NSDate *) dateByAddingDays: (NSInteger) dDays;
- (NSDate *) dateBySubtractingDays: (NSInteger) dDays;
- (NSDate *) dateByAddingHours: (NSInteger) dHours;
- (NSDate *) dateBySubtractingHours: (NSInteger) dHours;
- (NSDate *) dateByAddingMinutes: (NSInteger) dMinutes;
- (NSDate *) dateBySubtractingMinutes: (NSInteger) dMinutes;

// Date extremes
- (NSDate *) dateAtStartOfDay;
- (NSDate *) dateAtEndOfDay;

// Retrieving intervals
- (NSInteger) minutesAfterDate: (NSDate *) aDate;
- (NSInteger) minutesBeforeDate: (NSDate *) aDate;
- (NSInteger) hoursAfterDate: (NSDate *) aDate;
- (NSInteger) hoursBeforeDate: (NSDate *) aDate;
- (NSInteger) daysAfterDate: (NSDate *) aDate;
- (NSInteger) daysBeforeDate: (NSDate *) aDate;
- (NSInteger)distanceInDaysToDate:(NSDate *)anotherDate;

//时间戳转换成当前时间字符串
+(NSString *)longChangeDate:(NSString *)longString;
/**
 时间戳转换时间字符串（@"YYYY-MM-dd hh:mm:ss"）
 */
+ (NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;


/**
 将某个时间转化成 时间戳
 */
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;

#pragma mark 时间分隔单位

/** 接下来最近的小时 */
@property (readonly) NSInteger nearestHour;

/** 小时 */
@property (readonly) NSInteger hour;

/** 分钟 */
@property (readonly) NSInteger minute;

/** 秒钟 */
@property (readonly) NSInteger seconds;

/** 日期 */
@property (readonly) NSInteger day;

/** 月份 */
@property (readonly) NSInteger month;

/** 年份 */
@property (readonly) NSInteger year;

/** 当年的第几个星期 */
@property (readonly) NSInteger week;

/** 星期几 */
@property (readonly) NSInteger weekday;

/** 当月第几个星期 */
@property (readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2


+ (NSInteger)day:(NSDate *)date;

+ (NSInteger)month:(NSDate *)date;

+ (NSInteger)year:(NSDate *)date;

+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;

+ (NSInteger)totaldaysInThisMonth:(NSDate *)date;

+ (NSInteger)totaldaysInMonth:(NSDate *)date;

+ (NSDate *)lastMonth:(NSDate *)date;

+ (NSDate*)nextMonth:(NSDate *)date;

+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate;

/** 获取某个日期后n个月的日期 , n可以为正负*/
+ (NSDate *)getPriousorLaterDateFromDate:(NSDate *)date withMonth:(NSInteger)month;

/**
 获取当前时间戳
 */
+ (NSString *)getTimestamp;

@end
