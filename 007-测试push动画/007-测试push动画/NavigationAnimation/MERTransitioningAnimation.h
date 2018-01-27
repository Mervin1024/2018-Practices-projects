//
//  MERTransitioningAnimation.h
//  007-测试push动画
//
//  Created by 马遥 on 2018/1/27.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MERTransitioningAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CGPoint startingPoint;

- (instancetype)initWithOperation:(UINavigationControllerOperation)operation;

@end
