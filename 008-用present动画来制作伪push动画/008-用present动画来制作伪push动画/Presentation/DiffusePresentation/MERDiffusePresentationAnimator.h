//
//  MERDiffusePresentationAnimator.h
//  008-用present动画来制作伪push动画
//
//  Created by 马遥 on 2018/2/5.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "BFEPresentationAnimator.h"

@interface MERDiffusePresentationAnimator : BFEPresentationAnimator

- (instancetype)initWhenPresentation:(BOOL)isPresentation startingPoint:(CGPoint)startingPoint;

@end
