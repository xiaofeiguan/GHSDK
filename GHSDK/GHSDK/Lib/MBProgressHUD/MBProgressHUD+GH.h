//
//  MBProgressHUD+MJ.h
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (GH)

/**
 * 只显示提示的信息 --【kToastDuration秒之后隐藏】【自动】
 */

+ (void)showMsg:(NSObject *)msg;

/**
 * 显示提示的信息并且转圈 --【kToastDuration秒之后隐藏】【自动】
 */

+ (void)showProgressMsg:(NSObject *)msg;

/**
 * 显示加载转圈（忙碌中）--【kToastDuration秒之后隐藏】【自动】
 */
+ (void)showProgress;

/**
 * 隐藏提示
 */
+ (void)hideProgress;



/**
 *  一个只有提示的提示框---【1.0s后隐藏】【自动】
 */
+(void)showOnlyTextMessage:(NSString*)message;
/**
 *  一个只有提示的提示框且XX秒后隐藏---【duration秒后隐藏】【自动】
 *
 *  @param message  提示语
 *  @param duration  duration秒后隐藏
 */
+(void)showOnlyTextMessage:(NSString*)message duration:(CGFloat)duration;
/**
 *  完成（成功）的提示框---【自动】
 *
 *  @param success  提示语success
 */
+ (void)showSuccess:(NSString *)success;
/**
 *  失败的提示框---【自动】
 *
 *  @param error 提示语error
 */
+ (void)showError:(NSString *)error;
/**
 *  一直转圈的并且带有提示语的提示框---【非自动】
 *
 *  @param message 提示语
 *
 *  @return HUD对象
 */
+ (MBProgressHUD *)showMessage:(NSString *)message;
/**
 *  只有圆圈一直在转动---【非自动】
 */
+(void)showAnimationLoad;

/**
 *  延迟delay秒之后隐藏
 *
 *  @param delay 延迟XXX秒之后隐藏
 */
-(void)hideHUDWithDelay:(NSTimeInterval)delay;
/**
 *  隐藏HUD
 */
+ (void)hideHUD;


+ (void)hideHUDForView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
@end
