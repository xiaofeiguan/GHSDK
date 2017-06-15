//
//  NSData+GHExtension.m
//  GHSmoothFinal
//
//  Created by 刘观华 on 16/5/17.
//  Copyright © 2016年 Smooth光滑. All rights reserved.
//

#import "NSData+GHExtension.h"

@implementation NSData (GHExtension)
/**
 *  将16进制字符串转换成相同字母的NSData
 *  NSString:"3fd02asddff" --> NSData:"3fd02asddff"
 */
+(NSData *)DataWithHexString:(NSString *)hexString
{
    // hexString的长度应为偶数
    if ([hexString length] % 2 != 0)
        return nil;
    
    NSUInteger len = [hexString length];
    NSMutableData *retData = [[NSMutableData alloc] init];
    const char *ch = [[hexString dataUsingEncoding:NSASCIIStringEncoding] bytes];
    for (int i=0 ; i<len ; i+=2) {
        int height=0;
        if (ch[i]>='0' && ch[i]<='9')
            height = ch[i] - '0';
        else if (ch[i]>='A' && ch[i]<='F')
            height = ch[i] - 'A' + 10;
        else if (ch[i]>='a' && ch[i]<='f')
            height = ch[i] - 'a' + 10;
        else
            // 错误数据
            return nil;
        
        int low=0;
        if (ch[i+1]>='0' && ch[i+1]<='9')
            low = ch[i+1] - '0';
        else if (ch[i+1]>='A' && ch[i+1]<='F')
            low = ch[i+1] - 'A' + 10;
        else if (ch[i+1]>='a' && ch[i+1]<='f')
            low = ch[i+1] - 'a' + 10;
        else
            // 错误数据
            return nil;
        
        int byteValue = height*16 + low;
        [retData appendBytes:&byteValue length:1];
    }
    
    return retData;
}
@end
