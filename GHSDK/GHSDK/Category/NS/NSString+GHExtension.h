//
//  NSString+GHExtension.h
//  GHSmoothFinal
//
//  Created by 刘观华 on 16/5/16.
//  Copyright © 2016年 Smooth光滑. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GHExtension)

#pragma mark - 对时间的处理
/**
 * 获取今天是星期几？
 **/
+ (NSString *) getweekDayStringWithDate:(NSDate *) date;

#pragma mark - getAppInformation
/**
 *  获取应用版本号
 */
+ (NSString *)getMyApplicationVersion;
/**
 *  获取应用的名字
 */
+ (NSString *)getMyApplicationName;

#pragma mark - 加密算法
/**用于对字符串进行MD5加密**/
-(NSString *)md5String;
/**撒盐加密（先MD5加密再撒盐）**/
-(NSString*)shayanString:(NSString *)str;
/**MD5(MD5($pass))--mad5加密再加密**/
-(NSString *)doubleMD5:(NSString *)str;
/**
 *  先加密，后乱序
 *
 *  @param str 明文
 *
 *  @return 加密后的密文
 */
- (NSString *)MD5Reorder:(NSString *)str;

#pragma mark - 对NSString的操作

/**
 *  获取一段字符串本应该有的大小
 *  用处：主要用于计算UILabel的高度，根据label.text
 **/
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

/**
 *  获取项目下name文件里面的内容。
 *  name 文件名
 */
+ (NSString *)stringNamed:(NSString *)name;
/**
 *  去掉字符串里面空格
 */
- (NSString *)removeWhiteSpacesFromString;
/**
 *  以UTF-8的编码方式转化成NSData
 */
- (NSData *)convertToData;
/**
 *  获取以UTF—8编码的字符串（解决网络请求地址有中文的问题）
 */
-(NSString*)getUTF8String:(NSString*)string;
/**
 *  将NSData数据转换成NSString
 */
+ (NSString *)getStringFromData:(NSData *)data;

#pragma mark - 判断字符串是否符合某一类型
/**
 *  判断字符串是否有没有空格
 *   YES 没有空格  NO 有空格
 */
- (BOOL)isNotBlank;
/**
 *  是否包含某个字串
 */
- (BOOL)containsString:(NSString *)string;
/*
 * 是否包含某个样式CharacterSet
 */
- (BOOL)containsCharacterSet:(NSCharacterSet *)set;
/**
 *  是否只包含字母
 */
- (BOOL)containsOnlyLetters;
/**
 *  是否只包含数字
 */
- (BOOL)containsOnlyNumbers;
/**
 *  是否只包含字母和数字
 */
- (BOOL)containsOnlyNumbersAndLetters;

/**
 *  是否符合合法变量命名规则（只包含数字字母下划线）
 */
-(BOOL)isValidVariable;
/**
 *  是否字符串为空或者是null
 */
-(BOOL)isValid;
/**
 *  是否是有效的电话号码
 */
- (BOOL)isValidPhoneNumber;
/**
 *  是否是有效的url地址
 */
- (BOOL)isValidUrl;

@end
