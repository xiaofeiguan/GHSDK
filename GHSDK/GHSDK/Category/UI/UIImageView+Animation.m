//
//  UIImageView+AddMethod.m
//  MVVMProject
//
//  Created by 刘观华 on 28/12/15.
//  Copyright © 2015年 刘观华. All rights reserved.
//

#import "UIImageView+Animation.h"

#define MaxRepeatCount 100000  //最大的循环次数
#define rotationDuration 2   //

@implementation UIImageView (Animation)
/**让imageView实现自动旋转功能**/
-(void)rotate360DegreeWithImageViewWithDuration:(NSInteger)duration
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MaxRepeatCount;
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
/**让imageView结束旋转**/
-(void)endRotationWithImageView
{
    [self.layer removeAllAnimations];
}
@end
