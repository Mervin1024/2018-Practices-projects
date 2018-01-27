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

@end

@implementation MERNavigationDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return nil;
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
