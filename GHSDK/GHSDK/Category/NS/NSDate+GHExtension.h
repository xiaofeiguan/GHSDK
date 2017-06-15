//
//  NSDate+GHExtension.h
//  GHSmoothFinal
//
//  Created by 刘观华 on 16/5/17.
//  Copyright © 2016年 Smooth光滑. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GHExtension)
/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear;
/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday;

#pragma mark - Date Format

/**
 *  将NSDate对象以NSFormater的形式转成NSString
 *  [NSDate data](当前时间)--->  2016-08-18 11:35:20
 *
 **/
-(NSString *)dateStringWithFormat:(NSString *)format;

/**
 *  根据传入的美欧形式的时间字符串，判断该日期相对于当前时间的时间差
 *  如 "Thu Oct 16 17:06:25 +0800 2015"  相对于当前"2016-08-18 12:00:00"
 *  return "一年前"/"2个月前 08-13"/"昨天 13:45"/"8个小时前"/"54分钟前"/"刚刚"
 *
 *   用于处理“新浪微博”给出时间做相应的处理。
 **/
+(NSString *)stringAdvanceWithUSDateString:(NSString *)dateString;

/*
 *  将时间戳(1320345675)转成"2014-04-30 10:05:28"的字符串
 */
+(NSString *)stringWithTimeStamp:(NSInteger)timeStamp;

@end
