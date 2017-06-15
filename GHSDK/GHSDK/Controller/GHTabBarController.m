//
//  GHTabBarController.m
//  百思不得姐
//
//  Created by 刘观华 on 16/2/20.
//  Copyright © 2016年 刘观华. All rights reserved.
//

#import "GHTabBarController.h"
#import "GHNavigationController.h"

@interface GHTabBarController ()

@end

@implementation GHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *attr = [[NSMutableDictionary alloc]init];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    attr[NSForegroundColorAttributeName]= [UIColor darkGrayColor];
    //后面带有UI——APPEARANCE_SELECTOR方法可以统一设置。
    //例如：[UINavigationBar appearance]
    [[UITabBarItem appearance] setTitleTextAttributes:attr forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:attr forState:UIControlStateSelected];
    
//    [self setupChildVc:[GHEssenceViewController new] titleName:@"精华" imageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon"];

//    // 替换tabbar
//    [self setValue:[[GHTabBar alloc] init] forKeyPath:@"tabBar"];
//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
}



/**
 **添加子控制器
 **/
-(void)setupChildVc:(UIViewController*)vc titleName:(NSString*)title  imageName:(NSString*)image selectedImageName:(NSString*)selectedImage
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    GHNavigationController *navi = [[GHNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:navi];
}





@end
