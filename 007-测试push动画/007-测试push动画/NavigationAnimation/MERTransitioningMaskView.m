//
//  MERTransitioningMaskView.m
//  007-测试push动画
//
//  Created by 马遥 on 2018/1/30.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "MERTransitioningMaskView.h"

@implementation MERTransitioningMaskView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    CGPathRef path = ovalPath.CGPath;
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    CGContextDrawPath(ctx, kCGPathFill);
}

@end
