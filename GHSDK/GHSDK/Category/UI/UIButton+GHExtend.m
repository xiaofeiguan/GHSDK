//
//  UIButton+GHExtend.m
//  GHSmoothV
//
//  Created by 刘观华 on 16/8/12.
//  Copyright © 2016年 SmoothV. All rights reserved.
//

#import "UIButton+GHExtend.h"

@implementation UIButton (GHExtend)
/**
 *   Button倒计时效果
 *   timeLine            倒计时的时间（s）
 *   showTimerLabel  盖在button上面的UILabel，通过每隔一秒修改text达到倒计时的动态效果
 */
-(void)startWithTime:(NSInteger)timeLine  showLabel:(UILabel*)showTimerLabel
{
    UIColor *currentColor =  showTimerLabel.textColor;
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    //每秒会将block里面的操作执行一边。
    dispatch_source_set_event_handler(_timer, ^{
        if (timeOut <= 0) {
            //倒计时关闭
            dispatch_async(dispatch_get_main_queue(), ^{
                showTimerLabel.textColor = currentColor;
                showTimerLabel.text = @"点击再次验证";
                self.userInteractionEnabled = YES;
                //退出线程
                dispatch_source_cancel(_timer);
            });
            //取消该资源线程
            dispatch_source_cancel(_timer);
        }else{
            timeOut--;
            dispatch_async(dispatch_get_main_queue(), ^{
                showTimerLabel.textColor = [UIColor lightGrayColor];
                showTimerLabel.text = [NSString stringWithFormat:@"剩余%02lds",timeOut];
                self.userInteractionEnabled = NO;
            });
        }
    });
    dispatch_resume(_timer);
}
@end
