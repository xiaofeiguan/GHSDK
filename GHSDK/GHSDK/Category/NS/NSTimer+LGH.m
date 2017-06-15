//
//  NSTimer+LGH.m
//  GHSDK
//
//  Created by 刘观华 on 16/9/14.
//  Copyright © 2016年 SmoothV. All rights reserved.
//

#import "NSTimer+LGH.h"

@implementation NSTimer (LGH)

/**
 *  暂停
 */
- (void)pause {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate distantFuture]];
}
/**
 *  继续
 */
- (void)goOn {
    if (![self isValid]) {
        return;
    }
    //等价[self setFireDate:[NSDate distantPast]];
    [self setFireDate:[NSDate date]];
    
}
/**
 *  X秒后继续
 */
- (void)goOn:(NSTimeInterval)interval {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}
@end
