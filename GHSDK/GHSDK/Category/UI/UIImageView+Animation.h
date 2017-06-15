//
//  UIImageView+AddMethod.h
//  MVVMProject
//
//  Created by 刘观华 on 28/12/15.
//  Copyright © 2015年 刘观华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (AddMethod)
/**
 * 让imageView实现自动旋转功能
 **/
-(void)rotate360DegreeWithImageViewWithDuration:(NSInteger)duration;
/**
 * 让imageView结束旋转
 **/
-(void)endRotationWithImageView;

@end
