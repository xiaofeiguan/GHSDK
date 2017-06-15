//
//  GHNavigationController.m
//  百思不得姐
//
//  Created by 刘观华 on 16/2/21.
//  Copyright © 2016年 刘观华. All rights reserved.
//

#import "GHNavigationController.h"

@implementation GHNavigationController

/**设置状态栏为高亮状态**/
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

/*
 * initialize只会执行一次。
 
 */
+(void)initialize
{
    //设置导航栏的背景图片
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航栏的背景色来设置它的背景。
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:kRGBColor(235, 87, 84)];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:24];
    [[UINavigationBar appearance]setTitleTextAttributes:attrs];
    //让导航栏自带的返回title消失。
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    //设置导航栏不透明
    [UINavigationBar appearance].translucent = NO;
}

/*push之后的操作，在这里设置。*/
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //效果达不到
//    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    if(self.childViewControllers.count>0)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setTitle:@"返回" forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        //[button sizeToFit];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        button.size = CGSizeMake(60,35);
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        spaceItem.width = -15;
        viewController.navigationItem.leftBarButtonItems = @[spaceItem,[[UIBarButtonItem alloc]initWithCustomView:button]];
    }
    //放到后面，以后再设置可以覆盖上面的设置。
    [super pushViewController:viewController animated:animated];
}

-(void)pop
{
    [self popViewControllerAnimated:YES];
}

@end
