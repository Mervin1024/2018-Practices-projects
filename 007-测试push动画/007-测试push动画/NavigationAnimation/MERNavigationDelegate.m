//
//  MERNavigationDelegate.m
//  007-测试push动画
//
//  Created by 马遥 on 2018/1/27.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "MERNavigationDelegate.h"
#import "MERTransitioningAnimation.h"

@interface MERNavigationDelegate () 
@property (nonatomic, weak) UIViewController *popFromVC;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;

@end

@implementation MERNavigationDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setPopGestureRecognizerToViewController:(UIViewController *)viewController {
    _popFromVC = viewController;
    UIScreenEdgePanGestureRecognizer *popRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePopRecognizer:)];
    popRecognizer.edges = UIRectEdgeLeft;
    [_popFromVC.view addGestureRecognizer:popRecognizer];
}

- (void)handlePopRecognizer:(UIScreenEdgePanGestureRecognizer*)recognizer {
    CGFloat progress = [recognizer translationInView:_popFromVC.view].x / (_popFromVC.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        // Create a interactive transition and pop the view controller
        NSLog(@"Pop开始");
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        if ([_popFromVC.navigationController.viewControllers indexOfObject:_popFromVC] > 0) {
            [_popFromVC.navigationController popViewControllerAnimated:YES];
        }
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged) {
        // Update the interactive transition's progress
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        // Finish or cancel the interactive transition
        
        CGPoint velocity = [recognizer velocityInView:_popFromVC.view];
        if ((progress > 0.25 && velocity.x > 0) || progress > 0.5) {
            NSLog(@"Pop完成");
            self.interactivePopTransition.completionSpeed = 1;
            [self.interactivePopTransition finishInteractiveTransition];
        } else {
            NSLog(@"Pop取消");
            [self.interactivePopTransition updateInteractiveTransition:0.f];
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        self.interactivePopTransition = nil;
    }
}


#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactivePopTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
//    if (operation == UINavigationControllerOperationPop) {
//        return nil;
//    }
//    if (operation == UINavigationControllerOperationPush) {
//        return nil;
//    }
    MERTransitioningAnimation *animation = [[MERTransitioningAnimation alloc] initWithOperation:operation];
    animation.startingPoint = self.startingPoint;
    return animation;
}


@end
