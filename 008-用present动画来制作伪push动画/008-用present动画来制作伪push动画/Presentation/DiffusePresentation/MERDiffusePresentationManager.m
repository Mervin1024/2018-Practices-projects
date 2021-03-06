//
//  MERDiffusePresentationManager.m
//  008-用present动画来制作伪push动画
//
//  Created by 马遥 on 2018/2/5.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "MERDiffusePresentationManager.h"
#import "MERDiffusePresentationController.h"
#import "MERDiffusePresentationAnimator.h"
#import "MERDiffusePresentationInteractive.h"

@implementation MERDiffusePresentationManager {
    CGPoint _startingPoint;
    MERDiffusePresentationInteractive *_interactive;
}

- (instancetype)initWithStartingPoint:(CGPoint)startingPoint {
    self = [super init];
    if (self) {
        _startingPoint = startingPoint;
        _interactive = [[MERDiffusePresentationInteractive alloc] init];
    }
    return self;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    MERDiffusePresentationController *controller = [[MERDiffusePresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return controller;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    [_interactive setDismissGestureRecognizerToViewController:presented];
    MERDiffusePresentationAnimator *animator = [[MERDiffusePresentationAnimator alloc] initWhenPresentation:YES startingPoint:_startingPoint];
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    MERDiffusePresentationAnimator *animator = [[MERDiffusePresentationAnimator alloc] initWhenPresentation:NO startingPoint:_startingPoint];
    return animator;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return _interactive.isInteracting ? _interactive : nil;
}

@end
