//
//  NSString+GHExtension.m
//  GHSmoothFinal
//
//  Created by 刘观华 on 16/5/16.
//  Copyright © 2016年 Smooth光滑. All rights reserved.
//

#import "NSString+GHExtension.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
@implementation NSString (GHExtension)

#pragma mark - 对时间的处理
/**
 * 获取今天是星期几？
 **/
+ (NSString *) getweekDayStringWithDate:(NSDate *) date
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    
    // 1 是周日，2是周一 3.以此类推
    
    NSNumber * weekNumber = @([comps weekday]);
    NSInteger weekInt = [weekNumber integerValue];
    NSString *weekDayString = @"(周一)";
    switch (weekInt) {
        case 1:
        {
            weekDayString = @"(周日)";
        }
            break;
            
        case 2:
        {
            weekDayString = @"(周一)";
        }
            break;
            
        case 3:
        {
            weekDayString = @"(周二)";
        }
            break;
            
        case 4:
        {
            weekDayString = @"(周三)";
        }
            break;
            
        case 5:
        {
            weekDayString = @"(周四)";
        }
            break;
            
        case 6:
        {
            weekDayString = @"(周五)";
        }
            break;
            
        case 7:
        {
            weekDayString = @"(周六)";
        }
            break;
            
        default:
            break;
    }
    return weekDayString;
}

#pragma mark - getAppInformation
/**
 *  获取应用版本号
 */
+ (NSString *)getMyApplicationVersion
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleVersion = [info objectForKey:@"CFBundleVersion"];
    NSString *shortVersion = [info objectForKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"%@.%@", shortVersion, bundleVersion];
}
/**
 *  获取应用的名字
 */
+ (NSString *)getMyApplicationName
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleDisplayName"];
    return name;
}

#pragma mark - 加密算法
/**用于对字符串进行MD5加密**/
-(NSString *)md5String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    return [self stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}
/**撒盐加密（先MD5加密再撒盐）**/
-(NSString*)shayanString:(NSString *)str
{
    NSString *salt = [str stringByAppendingString:@"256"];
    return [salt md5String];
}
/**MD5(MD5($pass))--mad5加密再加密**/
-(NSString *)doubleMD5:(NSString *)str
{
    return [[str md5String]md5String];
}
/**先加密，后乱序
 @param str 明文
 @return 加密后的密文
 */
- (NSString *)MD5Reorder:(NSString *)str
{
    //加密
    NSString *pwd = [str md5String];
    //乱序
    NSString *prefix = [pwd substringFromIndex:2];
    NSString *subfix = [pwd substringToIndex:2];
    NSString *result = [prefix stringByAppendingString:subfix];
    return result;
}
#pragma mark - 对字符串的操作

/**
 *  获取一段字符串本应该有的大小
 *  用处：主要用于计算UILabel的高度，根据label.text
 **/
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

/**
 *  获取项目下name文件里面的内容。
 *  name 文件名
 */
+ (NSString *)stringNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    if (!str) {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
        str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    }
    return str;
}

/**
 *  以UTF-8的编码方式转化成NSData
 */
- (NSData *)convertToData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}
/**
 *  获取以UTF—8编码的字符串（解决网络请求地址有中文的问题）
 */
-(NSString*)getUTF8String:(NSString*)string
{
    return [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
/**
 *  将NSData数据转换成NSString
 */
+ (NSString *)getStringFromData:(NSData *)data
{
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
}
/**
 *  删除输入字符串的头尾的空白符号。
 */
- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];//以set方式进行修剪
}
/**
 *  去掉字符串里面空格
 */
- (NSString *)removeWhiteSpacesFromString
{
    NSString *string = [self stringByTrimmingCharactersInSet:
                        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSArray *components = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    components = [components filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self <> ''"]];
    
    NSString *trimmedString = [components componentsJoinedByString:@""];
    return trimmedString;
}

#pragma mark - 判断字符串是否符合某一类型
/**
 *  判断字符串首尾有没有空格
 *   YES 没有空格  NO 有空格
 */
- (BOOL)isNotBlank {
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}
/**
 *  是否包含某个字串
 */
- (BOOL)containsString:(NSString *)string {
    if (string == nil) return NO;
    return [self rangeOfString:string].location != NSNotFound;
}
/*
 * 是否包含某个样式CharacterSet
 */
- (BOOL)containsCharacterSet:(NSCharacterSet *)set {
    if (set == nil) return NO;
    return [self rangeOfCharacterFromSet:set].location != NSNotFound;
}
/**
 *  是否只包含字母
 */
- (BOOL)containsOnlyLetters
{
    NSString *regex = @"^[a-zA-Z]+$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}
/**
 *  是否只包含数字
 */
- (BOOL)containsOnlyNumbers
{
    //方式一:正则表达式
    NSString *regex = @"^[0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
    //方式二
//    NSCharacterSet *numbersCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
//    return ([self rangeOfCharacterFromSet:numbersCharacterSet].location == NSNotFound);
}
/**
 *  是否只包含字母和数字
 */
- (BOOL)containsOnlyNumbersAndLetters
{
    //方式一:正则表达式
    NSString *regex = @"^[a-zA-Z0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
    //方式二
//    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
//    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}
/**
 *  是否符合合法变量命名规则（只包含数字字母下划线）
 */
-(BOOL)isValidVariable
{
    //正则表达式
    NSString *regex = @"^[a-zA-Z0-9_]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}
/**
 *  是否字符串为空或者是null
 */
-(BOOL)isValid
{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""] || self == nil || [self isEqualToString:@"(null)"]) ? NO :YES;
}

/**
 *  是否是有效的电话号码
 */
- (BOOL)isValidPhoneNumber
{
    /*
     *
     支持手机号段:
     移动：139   138   137   136   135   134   147   150   151   152   157   158    159   178  182   183   184   187   188  170
     联通： 130   131   132   155   156   185   186   145   176
     电信： 133   153   177   180   181   189
     */
    NSString *regex = @"^0?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:self];
}
/**
 *  是否是有效的url地址
 */
- (BOOL)isValidUrl
{
    NSString *regex =@"[a-zA-z]+://[^\\s]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}

#pragma mark - helpers
-(NSString *)stringFromBytes:(unsigned char *)bytes length:(int)length
{
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++) {
        [mutableString appendFormat:@"%02x",bytes[i]];
    }
    return [NSString stringWithString:mutableString];
}
@end
