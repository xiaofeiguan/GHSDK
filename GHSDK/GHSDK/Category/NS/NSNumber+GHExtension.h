//
//  NSNumber+GHExtension.h
//  GHSmoothFinal
//
//  Created by 刘观华 on 16/5/17.
//  Copyright © 2016年 Smooth光滑. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (GHExtension)
/**
 *  提供一个方法将NSString类型的数值转换成NSNumber(可以转换BOOL/十六进制/普通数字)
 *
 **/
+(NSNumber *)numberWithString:(NSString *)string;
@end
