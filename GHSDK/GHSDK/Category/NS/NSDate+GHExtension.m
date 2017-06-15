//
//  NSDate+GHExtension.m
//  GHSmoothFinal
//
//  Created by 刘观华 on 16/5/17.
//  Copyright © 2016年 Smooth光滑. All rights reserved.
//

#import "NSDate+GHExtension.h"

@implementation NSDate (GHExtension)
/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获得某个时间的年月日时分秒
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return dateCmps.year == nowCmps.year;
}

/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday
{
    NSDate *now = [NSDate date];
    
    // date ==  2014-04-30 10:05:28 --> 2014-04-30 00:00:00
    // now == 2014-05-01 09:22:10 --> 2014-05-01 00:00:00
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 2014-04-30
    NSString *dateStr = [fmt stringFromDate:self];
    // 2014-10-18
    NSString *nowStr = [fmt stringFromDate:now];
    
    // 2014-10-30 00:00:00
    NSDate *date = [fmt dateFromString:dateStr];
    // 2014-10-18 00:00:00
    now = [fmt dateFromString:nowStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday
{
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";// -->  (年月日)
    
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}


#pragma mark - Date Format

/**
 *  将NSDate对象以NSFormater的形式转成NSString
 *  [NSDate data](当前时间)--->  2016-08-18 11:35:20
 *
 **/
-(NSString *)dateStringWithFormat:(NSString *)format
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = format;
    return  [formatter stringFromDate:self];
}


/**
 *  根据传入的美欧形式的时间字符串，判断该日期相对于当前时间的时间差
 *  如 "Thu Oct 16 17:06:25 +0800 2015"  相对于当前"2016-08-18 12:00:00"
 *  return "一年前"/"2个月前 08-13"/"昨天 13:45"/"8个小时前"/"54分钟前"/"刚刚"
 *
 *   用于处理“新浪微博”给出时间做相应的处理。
 **/

+(NSString *)stringAdvanceWithUSDateString:(NSString *)dateString
{
    //根据dateString来获取日期。
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    fmt.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en-US"];
    NSDate *createDate = [fmt dateFromString:dateString];
    // 当前时间
    NSDate *now = [NSDate date];
    // 日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSCalendarUnit枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:createDate toDate:now options:0];
    if ([createDate isThisYear]) { // 今年
        if ([createDate isYesterday]) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:createDate];
        } else if ([createDate isToday]) { // 今天
            if (cmps.hour >= 1) {
                return [NSString stringWithFormat:@"%ld小时前", cmps.hour];
            } else if (cmps.minute >= 1) {
                return [NSString stringWithFormat:@"%ld分钟前", cmps.minute];
            } else {
                return @"刚刚";
            }
        } else { // 今年的其他日子
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:createDate];
        }
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:createDate];
    }
}


/*
 *  将时间戳(1320345675)转成"2014-04-30 10:05:28"的字符串
 */
+(NSString *)stringWithTimeStamp:(NSInteger)timeStamp
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [fmt stringFromDate:date];
}



@end
