//
//  NSTimer+LGH.h
//  GHSDK
//
//  Created by 刘观华 on 16/9/14.
//  Copyright © 2016年 SmoothV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (LGH)
/**
 *  暂停
 */
- (void)pause;
/**
 *  继续
 */
- (void)goOn;
/**
 *  X秒后继续
 */
- (void)goOn:(NSTimeInterval)interval;
@end
