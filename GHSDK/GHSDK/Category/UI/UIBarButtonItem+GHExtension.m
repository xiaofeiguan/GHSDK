//
//  UIBarButtonItem+GHExtension.m
//  GHSmoothV
//
//  Created by 刘观华 on 16/8/12.
//  Copyright © 2016年 SmoothV. All rights reserved.
//

#import "UIBarButtonItem+GHExtension.h"

@implementation UIBarButtonItem (GHExtension)

/**
 *  用于创建UIBarButtonItems的数组对象(该item是带背景图片的)
 *
 *  @param target    button的Target
 *  @param selector  button的监听方法
 *  @param image     图片
 *  @param highImage 占位图片
 *  @param width     spaceBarItem的width
 *
 *  @return UIBarButtonItems的数组对象
 */
+(NSArray <UIBarButtonItem*>*) itemWithTarget:(id)target action:(SEL)selector image:(NSString*)image highImage:(NSString*)highImage spaceItemWidth:(NSInteger)width
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    //设置图片
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = CGSizeMake(30, 30);
    //添加spaceBarItem
    UIBarButtonItem *spaceBarItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceBarItem.width = width;
    ;
    return @[spaceBarItem,[[UIBarButtonItem alloc]initWithCustomView:button]];
}

/**
 *  用于创建UIBarButtonItems的数组对象(该item是带文字的)
 *
 *  @param target   button的Target
 *  @param selector button的监听方法
 *  @param width    spaceBarItem的width
 *  @param string   titleName
 *  @param color    titleColor
 *
 *  @return UIBarButtonItems
 */
+(NSArray*)itemWithTargetObj:(id)target action:(SEL)selector  spaceItemWidth:(NSInteger)width title:(NSString *)string titleColor:(UIColor*)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 70, 35);
    button.titleLabel.text = string;
    [button  setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    //添加spaceBarItem
    UIBarButtonItem *spaceBarItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceBarItem.width = width;
    ;
    return @[spaceBarItem,[[UIBarButtonItem alloc]initWithCustomView:button]];
}

@end
