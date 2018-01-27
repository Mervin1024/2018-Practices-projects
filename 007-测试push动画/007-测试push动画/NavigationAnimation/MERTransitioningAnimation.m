//
//  MERTransitioningAnimation.m
//  007-测试push动画
//
//  Created by 马遥 on 2018/1/27.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "MERTransitioningAnimation.h"

@interface MERTransitioningAnimation () <CAAnimationDelegate>

@property (nonatomic, assign) UINavigationControllerOperation operation;
@property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation MERTransitioningAnimation

- (instancetype)initWithOperation:(UINavigationControllerOperation)operation {
    self = [super init];
    if (self) {
        _operation = operation;
    }
    return self;
}


#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    self.transitionContext = transitionContext;

    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIViewController *pushedVC = self.operation == UINavigationControllerOperationPush ? toVC : fromVC;
    if (self.operation == UINavigationControllerOperationPush) {
        [transitionContext.containerView addSubview:toVC.view];
    } else {
        [transitionContext.containerView insertSubview:toVC.view belowSubview:fromVC.view];
    }

    CGRect smallRect = CGRectMake(self.startingPoint.x, self.startingPoint.y, 0, 0);
    UIBezierPath *circleMaskPathSmall = [UIBezierPath bezierPathWithOvalInRect:smallRect];
    CGPoint extremePoint = CGPointMake(self.startingPoint.x, CGRectGetHeight(pushedVC.view.bounds)-self.startingPoint.y);
    CGFloat radius = sqrtf(extremePoint.x * extremePoint.x + extremePoint.y * extremePoint.y);
    UIBezierPath *circleMaskPathLarge = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(smallRect, -radius, -radius)];


    UIBezierPath *circleMaskPathInitial = self.operation == UINavigationControllerOperationPush ? circleMaskPathSmall : circleMaskPathLarge;
    UIBezierPath *circleMaskPathFinal = self.operation == UINavigationControllerOperationPush ? circleMaskPathLarge : circleMaskPathSmall;

    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = circleMaskPathFinal.CGPath;
    pushedVC.view.layer.mask = maskLayer;

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id _Nullable)(circleMaskPathInitial.CGPath);
    animation.toValue = (__bridge id _Nullable)(circleMaskPathFinal.CGPath);
    animation.duration = [self transitionDuration:transitionContext];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.delegate = self;
    [maskLayer addAnimation:animation forKey:nil];
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self.transitionContext completeTransition:flag];
    NSString *key = self.operation == UINavigationControllerOperationPush ? UITransitionContextToViewControllerKey : UITransitionContextFromViewControllerKey;
    UIViewController *controller = [self.transitionContext viewControllerForKey:key];
    controller.view.layer.mask = nil;
}

@end
