//
//  NSNumber+GHExtension.m
//  GHSmoothFinal
//
//  Created by 刘观华 on 16/5/17.
//  Copyright © 2016年 Smooth光滑. All rights reserved.
//

#import "NSNumber+GHExtension.h"

@implementation NSNumber (GHExtension)
/**提供一个方法将NSString类型的数值转换成NSNumber(可以转换BOOL/十六进制/普通数字)**/
+(NSNumber *)numberWithString:(NSString *)string
{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *str = [[string stringByTrimmingCharactersInSet:set] lowercaseString];
    if (!str || !str.length) {
        return nil;
    }
    
    //BOOL类型（YES/NO）
    static NSDictionary *dic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dic = @{@"true" :   @(YES),
                @"yes" :    @(YES),
                @"false" :  @(NO),
                @"no" :     @(NO),
                @"nil" :    [NSNull null],
                @"null" :   [NSNull null],
                @"<null>" : [NSNull null]};
    });
    
    NSNumber *num = dic[str];
    if (num) {
        if (num == (id)[NSNull null]) {
            return nil;
        }
        return num;
    }
    
    if ([str  isEqual: @"0"]) {
        return @(0);
    }
    //hex number(十六进制)
    int sign = 0;
    if ([str hasPrefix:@"0x"]) sign = 1;
    else if ([str hasPrefix:@"-0x"]) sign = -1;
    if (sign != 0) {
        NSScanner *scan = [NSScanner scannerWithString:string];
        unsigned num = -1;
        BOOL suc = [scan scanHexInt:&num];
        if (suc)
            return [NSNumber numberWithLong:((long)num * sign)];
        else
            return nil;
    }
    
    // normal number（普通数字）
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return [formatter numberFromString:str];
    
}
@end
