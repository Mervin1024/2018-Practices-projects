//
//  MERTransitioningMaskLayer.m
//  007-测试push动画
//
//  Created by 马遥 on 2018/1/30.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "MERTransitioningMaskLayer.h"

@interface MERTransitioningMaskLayer ()
@end

@implementation MERTransitioningMaskLayer

- (instancetype)initWithCenterPoint:(CGPoint)centerPoint radius:(CGFloat)radius {
    self = [super init];
    if (self) {
//        NSLog(@"initWithCenterPoint");
        self.contentsScale = [UIScreen mainScreen].scale;
        _centerPoint = centerPoint;
        _radius = radius;
    }
    return self;
}

- (instancetype)init {
    NSLog(@"init");
    CGPoint center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetMidY([UIScreen mainScreen].bounds));
    return [self initWithCenterPoint:center radius:0];
}

- (void)setRadius:(CGFloat)radius {
    _radius = radius;
    [self setNeedsDisplay];
}

- (UIBezierPath *)ovalPath {
    CGRect smallRect = CGRectMake(self.centerPoint.x, self.centerPoint.y, 0, 0);
    CGRect ovalRect = CGRectInset(smallRect, -self.radius, -self.radius);
    return [UIBezierPath bezierPathWithOvalInRect:ovalRect];
}

- (void)drawInContext:(CGContextRef)ctx {
    
    CGPathRef path = [self ovalPath].CGPath;
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    CGContextDrawPath(ctx, kCGPathFill);
}

// Override

- (instancetype)initWithLayer:(MERTransitioningMaskLayer *)layer {
    self = [super initWithLayer:layer];
    if (self) {
        _centerPoint = layer.centerPoint;
        _radius = layer.radius;
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"radius"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

@end
