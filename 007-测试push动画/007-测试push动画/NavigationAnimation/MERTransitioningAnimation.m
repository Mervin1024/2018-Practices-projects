//
//  MERTransitioningAnimation.m
//  007-测试push动画
//
//  Created by 马遥 on 2018/1/27.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "MERTransitioningAnimation.h"
#import "MERTransitioningMaskLayer.h"
#import "MERTransitioningMaskView.h"

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
    return self.operation == UINavigationControllerOperationPush ?0.4:2;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
//    self.transitionContext = transitionContext;

    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *pushedVC = self.operation == UINavigationControllerOperationPush ? toVC : fromVC;
    if (self.operation == UINavigationControllerOperationPush) {
        [transitionContext.containerView addSubview:toVC.view];
    } else {
        [transitionContext.containerView insertSubview:toVC.view belowSubview:fromVC.view];
    }
    
    
    CGRect smallRect = CGRectMake(self.startingPoint.x, self.startingPoint.y, 1, 1);
    CGPoint extremePoint = CGPointMake(self.startingPoint.x, CGRectGetHeight(pushedVC.view.bounds)-self.startingPoint.y);
    CGFloat radius = sqrtf(extremePoint.x * extremePoint.x + extremePoint.y * extremePoint.y);
    CGRect largeRect = CGRectInset(smallRect, -radius, -radius);
    
    CGRect initialRect = self.operation == UINavigationControllerOperationPush ? smallRect : largeRect;
    CGRect finalRect = self.operation == UINavigationControllerOperationPush ? largeRect : smallRect;
    
    
    
    MERTransitioningMaskView *maskView = [[MERTransitioningMaskView alloc] initWithFrame:initialRect];
    if (self.operation == UINavigationControllerOperationPop) {
        UIView *view = [maskView snapshotViewAfterScreenUpdates:YES];
        pushedVC.view.maskView = view;
    } else {
        pushedVC.view.maskView = maskView;
    }

    pushedVC.view.maskView.frame = initialRect;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
        pushedVC.view.maskView.frame = finalRect;
    } completion:^(BOOL finished) {
        pushedVC.view.maskView = nil;
        [transitionContext completeTransition:finished];
    }];
    
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSString *key = self.operation == UINavigationControllerOperationPush ? UITransitionContextToViewControllerKey : UITransitionContextFromViewControllerKey;
    UIViewController *controller = [self.transitionContext viewControllerForKey:key];
    controller.view.layer.mask = nil;
    [self.transitionContext completeTransition:flag];

}

@end
