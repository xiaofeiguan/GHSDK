//
//  AppDelegate+Category.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate+Category.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "UIDevice+GHExtension.h"

@implementation AppDelegate (Category)


- (void)initializeWithApplication:(UIApplication *)application{
    //onLine
    BOOL __block onLine = false;
    //    电池条显示网络活动
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    //    监听检测网络状态
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        GHLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                onLine = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                onLine = NO;
                [self showOnlineAlert];
                break;
        }
    }];
    //开始监听
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
}

-(void)showOnlineAlert
{
    NSString *plantForm = [UIDevice typeAboutDevice];
    NSString *message = [NSString stringWithFormat:@"你的%@没有网络",plantForm];
    UIAlertView *onlineAlert = [[UIAlertView alloc]initWithTitle:@"警告" message:message delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
    [onlineAlert show];
}



@end
