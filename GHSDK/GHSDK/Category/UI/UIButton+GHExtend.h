//
//  UIButton+GHExtend.h
//  GHSmoothV
//
//  Created by 刘观华 on 16/8/12.
//  Copyright © 2016年 SmoothV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (GHExtend)
/**
 *   button倒计时效果
 *   timeLine            倒计时的时间（s）
 *   showTimerLabel  盖在button上面的UILabel，通过每隔一秒修改text达到倒计时的动态效果
 */
-(void)startWithTime:(NSInteger)timeLine  showLabel:(UILabel*)showTimerLabel;
@end
