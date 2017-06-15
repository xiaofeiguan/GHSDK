//
//  UIDevice+GHExtension.h
//  GHSmoothV
//
//  Created by 刘观华 on 16/8/15.
//  Copyright © 2016年 SmoothV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (GHExtension)
/**
 * 获取当前程序运行设备的型号
 **/
+(NSString *)typeAboutDevice;
/**
 *  获取当前程序运行的iOS系统的版本号
 **/
+(NSString*)iOSSystemVersion;

@end
