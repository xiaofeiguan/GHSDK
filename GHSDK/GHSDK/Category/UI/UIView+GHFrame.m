//
//  UIView+GHFrame.m
//  GHSDK
//
//  Created by 刘观华 on 16/9/14.
//  Copyright © 2016年 SmoothV. All rights reserved.
//

#import "UIView+GHFrame.h"

@implementation UIView (GHFrame)

// Retrieve and set the origin
- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)aPoint {
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}
// Retrieve and set height, width, top, bottom, left, right
- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newheight {
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

// Retrieve and set the size
- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)aSize {
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)newwidth {
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x {
    
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}
- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY {
    
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerX {
    
    return self.center.x;
}

- (CGFloat)centerY {
    return self.center.y;
}

@end
