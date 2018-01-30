//
//  MERTransitioningMaskLayer.h
//  007-测试push动画
//
//  Created by 马遥 on 2018/1/30.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface MERTransitioningMaskLayer : CALayer

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGPoint centerPoint;

- (instancetype)initWithCenterPoint:(CGPoint)centerPoint radius:(CGFloat)radius;

@end
