//
//  AnimationView.m
//  005-一个复杂动画的实现_OC
//
//  Created by 马遥 on 2018/1/23.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "AnimationView.h"
#import "CircleLayer.h"
#import "TriangleLayer.h"
#import "RectangleLayer.h"
#import "WaveLayer.h"

@interface AnimationView () <CAAnimationDelegate>
@property (nonatomic, strong) CALayer *transformLayer;
@property (nonatomic, strong) CircleLayer *circleLayer;
@property (nonatomic, strong) TriangleLayer *triangleLayer;
@property (nonatomic, strong) RectangleLayer *redRectangleLayer;
@property (nonatomic, strong) RectangleLayer *greenRectangleLayer;
@property (nonatomic, strong) WaveLayer *waveLayer;
@end

@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)startAnimation {
    self.backgroundColor = [UIColor whiteColor];
//    [self.circleLayer removeFromSuperlayer];
//    [self.triangleLayer removeFromSuperlayer];
    [_transformLayer removeFromSuperlayer];
    _transformLayer = nil;
//    [self.redRectangleLayer removeFromSuperlayer];
//    [self.greenRectangleLayer removeFromSuperlayer];
//    [self.waveLayer removeFromSuperlayer];
    
    [self.layer addSublayer:self.transformLayer];
    [self startFirstAnimation];
}

- (void)startFirstAnimation {
    // 首先加入椭圆动画
    [self.transformLayer addSublayer:self.circleLayer];
    [self.circleLayer startExpand];
    
    // 1.2s 后加入三角形动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startSecondAnimation];
    });
}

- (void)startSecondAnimation {
    [self.transformLayer addSublayer:self.triangleLayer];
    [self.triangleLayer startAppear];
    
    // 0.9s 后加入旋转动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startThirdAnimation];
    });
}

- (void)startThirdAnimation {
    [self.transformLayer addAnimation:[self transformAnimation] forKey:nil];
    [self.circleLayer startReduce];
    
    // 0.4s 后加入红色矩形动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startFourthAnimation];
    });
}

- (void)startFourthAnimation {
    [self.transformLayer addSublayer:self.redRectangleLayer];
    [self.redRectangleLayer startStrokeWithColor:[UIColor colorWithRed:218/255.0 green:112/255.0 blue:214/255.0 alpha:1]];
    
    // 0.2s 后加入绿色动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startFifthAnimation];
    });
}

- (void)startFifthAnimation {
    [self.transformLayer addSublayer:self.greenRectangleLayer];
    [self.greenRectangleLayer startStrokeWithColor:[UIColor colorWithRed:64/255.0 green:224/255.0 blue:176/255.0 alpha:1]];
    
    // 0.4s 后加入波浪动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startSixthAnimation];
    });
}

- (void)startSixthAnimation {
    [self.transformLayer addSublayer:self.waveLayer];
    [self.waveLayer startAnimation];
    
    // 0.9s 后加入放大动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startSeventhAnimation];
    });
}

- (void)startSeventhAnimation {
    [self expand];
}

#pragma mark - Layers

- (CALayer *)transformLayer {
    if (!_transformLayer) {
        _transformLayer = [CALayer layer];
        _transformLayer.frame = self.layer.bounds;
    }
    return _transformLayer;
}

- (CircleLayer *)circleLayer {
    if (!_circleLayer) {
        _circleLayer = [CircleLayer layer];
    }
    return _circleLayer;
}

- (TriangleLayer *)triangleLayer {
    if (!_triangleLayer) {
        _triangleLayer = [TriangleLayer layer];
    }
    return _triangleLayer;
}

- (RectangleLayer *)redRectangleLayer {
    if (!_redRectangleLayer) {
        _redRectangleLayer = [RectangleLayer layer];
    }
    return _redRectangleLayer;
}

- (RectangleLayer *)greenRectangleLayer {
    if (!_greenRectangleLayer) {
        _greenRectangleLayer = [RectangleLayer layer];
    }
    return _greenRectangleLayer;
}

- (WaveLayer *)waveLayer {
    if (!_waveLayer) {
        _waveLayer = [WaveLayer layer];
    }
    return _waveLayer;
}

#pragma mark - Animation

- (CABasicAnimation *)transformAnimation {
//    self.layer.anchorPoint = CGPointMake(0.5, 0.5);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = @(M_PI * 2);
    animation.duration = 0.45;
    return animation;
}

- (void)expand {
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat rectWidth = (0.866 * (90/2.0+15) + 5/2.0) * 2;
    CGFloat newWidth = bounds.size.width / rectWidth * bounds.size.width;
    CGFloat newHeight = bounds.size.height / rectWidth * bounds.size.height;
    CGRect newRect = CGRectMake(-(newWidth-bounds.size.width)/2, -(newHeight-bounds.size.height)/2, newWidth, newHeight);

    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = newRect;
    } completion:^(BOOL finished) {
        self.layer.sublayers = nil;
        self.backgroundColor = [UIColor colorWithRed:64/255.0 green:224/255.0 blue:176/255.0 alpha:1];
        if (self.animationCompleted) {
            self.animationCompleted(finished);
        }
    }];
}
@end
