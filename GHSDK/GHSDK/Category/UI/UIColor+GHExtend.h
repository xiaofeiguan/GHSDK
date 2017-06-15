//
//  UIColor+GHExtend.h
//  GHSmoothV
//
//  Created by 刘观华 on 16/8/12.
//  Copyright © 2016年 SmoothV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (GHExtend)
/**代替kRGB的宏定义**/
+(UIColor *)colorForRGBWithRed:(NSInteger)red Green:(NSInteger)green Blue:(NSInteger)blue;

/**用十六进制来表示颜色，如：0x66ccff**/
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue;

/**用如下字符串的形式@"0x66ccff"来表示颜色 **/
+ (UIColor *)colorWithHexStr:(NSString *)hexStr;

@end
