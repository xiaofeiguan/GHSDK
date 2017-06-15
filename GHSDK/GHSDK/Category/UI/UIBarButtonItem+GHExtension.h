//
//  UIBarButtonItem+GHExtension.h
//  GHSmoothV
//
//  Created by 刘观华 on 16/8/12.
//  Copyright © 2016年 SmoothV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (GHExtension)
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
+(NSArray <UIBarButtonItem*>*) itemWithTarget:(id)target action:(SEL)selector image:(NSString*)image highImage:(NSString*)highImage spaceItemWidth:(NSInteger)width;
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
+(NSArray*)itemWithTargetObj:(id)target action:(SEL)selector  spaceItemWidth:(NSInteger)width title:(NSString *)string titleColor:(UIColor*)color;
@end
