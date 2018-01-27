//
//  MERTransitioningAnimation.m
//  007-测试push动画
//
//  Created by 马遥 on 2018/1/27.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "MERTransitioningAnimation.h"

@interface MERTransitioningAnimation () <UIViewControllerAnimatedTransitioning>

@end

@implementation MERTransitioningAnimation

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

- (void)animationEnded:(BOOL)transitionCompleted {
    
}

@end
