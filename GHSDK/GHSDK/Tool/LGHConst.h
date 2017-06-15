//
//  LGHConst.h
//  GHSDK
//
//  Created by 刘观华 on 16/9/14.
//  Copyright © 2016年 SmoothV. All rights reserved.
//

#ifndef LGHConst_h
#define LGHConst_h

//通过RGB设置颜色
#define kRGBColor(R,G,B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

#define kWindowH   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define kWindowW    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度

//状态栏高度
#define GHStatus_Bar_Height 20
//NavBar高度
#define GHNavigation_Bar_Height 44
//(状态栏 ＋ 导航栏) 高度
#define GHStatus_And_Navigation_Height ((GHStatus_Bar_Height) + (GHNavigation_Bar_Height))
//底部tab高度
#define GHTab_Bar_Height 49

//获取UIStoryBoard对象
#define kStoryboard(StoryboardName)     [UIStoryboard storyboardWithName:StoryboardName bundle:nil]
//通过Storyboard ID 在对应Storyboard中获取场景对象
#define kVCFromSb(storyboardId, storyboardName)     [[UIStoryboard storyboardWithName:storyboardName bundle:nil] \
instantiateViewControllerWithIdentifier:storyboardId]

//Document文件夹路径
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
//account.archive文件的路径（Document/account.archive）
#define kAccountPath  [kDocumentPath stringByAppendingString:@"account.archive"]

//移除iOS7之后，cell默认左侧的分割线边距
#define kRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}

//定义自己NSLog
#ifdef DEBUG
#define GHLog(...) NSLog(__VA_ARGS__)
#else
#define GHLog(...)
#endif


#endif /* LGHConst_h */
