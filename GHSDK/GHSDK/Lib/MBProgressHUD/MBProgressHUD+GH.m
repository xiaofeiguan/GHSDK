//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+GH.h"

//延迟隐藏的时间。
#define  kToastDuration  1.0

@implementation MBProgressHUD (GH)

#pragma mark - 达内教学做法

/**
 * 只显示提示的信息 --【kToastDuration秒之后隐藏】【自动】
 */

+ (void)showMsg:(NSObject *)msg{
    [MBProgressHUD hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[MBProgressHUD currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.labelText = msg.description;
    [progressHUD hide:YES afterDelay:kToastDuration];
}

/**
 *  显示提示信息，并且转圈。
 **/
+ (void)showProgressMsg:(NSObject *)msg
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[MBProgressHUD currentView] animated:YES];
    hud.labelText = msg.description;
    //隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //YES代表需要蒙版效果,NO代表不需要蒙层
    hud.dimBackground = NO;
}


/**
 * 显示加载转圈（忙碌中）--【kToastDuration秒之后隐藏】【自动】
 */
+ (void)showProgress{
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[MBProgressHUD currentView] animated:YES];
    [progressHUD hide:YES afterDelay:kToastDuration];
}

/**
 * 隐藏提示
 */
+ (void)hideProgress{
    [MBProgressHUD hideAllHUDsForView:[MBProgressHUD currentView] animated:YES];
}

+ (UIView *)currentView{
    UIViewController *controller = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    if ([controller isKindOfClass:[UITabBarController class]]) {
        controller = [(UITabBarController *)controller selectedViewController];
    }
    if([controller isKindOfClass:[UINavigationController class]]) {
        controller = [(UINavigationController *)controller visibleViewController];
    }
    if (!controller) {
        return [UIApplication sharedApplication].keyWindow;
    }
    return controller.view;
}



#pragma mark - 黑马教学做法

/**
 *  一个只有提示的提示框---【1.0s后隐藏】
 */
+(void)showOnlyTextMessage:(NSString*)message
{
    [self showOnlyTextMessage:message duration:1.0];
}

/**
 *  一个只有提示的提示框且XX秒后隐藏
 *
 *  @param message  提示语
 *  @param duration  duration秒后隐藏
 */
+(void)showOnlyTextMessage:(NSString*)message duration:(CGFloat)duration
{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    [hud hide:YES afterDelay:duration];
    hud.removeFromSuperViewOnHide = YES;
}

/**
 *  显示信息
 **/
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1.0];
}

/**
 *  显示错误信息
 **/
+ (void)showError:(NSString *)error toView:(UIView *)view{
    NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"MBProgress" ofType:@"bundle"];
    NSString *errorPath = [bundlePath stringByAppendingPathComponent:@"error.png"];
    [self show:error icon:errorPath view:view];
}

/**
 *  显示正确信息
 **/
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"MBProgress" ofType:@"bundle"];
    NSString *correctPath = [bundlePath stringByAppendingPathComponent:@"success.png"];
    [self show:success icon:correctPath view:view];
}

/**
 *   显示一些信息
 **/
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}


/**
 *  只有圆圈一直在转动。
 */
+(void)showAnimationLoad
{
    [self showMessage:nil];
}
/**
 *  延迟delay秒之后隐藏
 *
 *  @param delay 延迟XXX秒之后隐藏
 */
-(void)hideHUDWithDelay:(NSTimeInterval)delay
{
    [self hide:YES afterDelay:delay];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
@end
