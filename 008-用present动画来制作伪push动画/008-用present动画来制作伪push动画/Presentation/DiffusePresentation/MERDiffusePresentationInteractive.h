//
//  MERDiffusePresentationInteractive.h
//  008-用present动画来制作伪push动画
//
//  Created by 马遥 on 2018/2/6.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "BFEPresentationInteractive.h"

@interface MERDiffusePresentationInteractive : BFEPresentationInteractive

@property (nonatomic, assign) BOOL isInteracting;

- (void)setDismissGestureRecognizerToViewController:(UIViewController *)viewController;
@end
