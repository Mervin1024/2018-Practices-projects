//
//  ViewController.m
//  005-一个复杂动画的实现_OC
//
//  Created by 马遥 on 2018/1/23.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"

@interface ViewController ()
@property (nonatomic, strong) AnimationView *animationView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _animationView = [[AnimationView alloc] initWithFrame:self.view.bounds];
    _animationView.animationCompleted = ^(BOOL completed) {
        NSLog(@"动画已结束 ： %@",completed?@"YES":@"NO");
    };
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startAnimation:)];
    [self.view addGestureRecognizer:tap];
    [self.view addSubview:_animationView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startAnimation:nil];
}

- (void)startAnimation:(UITapGestureRecognizer *)tap {
    NSLog(@"点击=====开始动画");
    [_animationView startAnimation];
    
}


@end
