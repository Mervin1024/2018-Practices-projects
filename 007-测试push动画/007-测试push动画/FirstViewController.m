//
//  FirstViewController.m
//  007-测试push动画
//
//  Created by 马遥 on 2018/1/26.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "FirstViewController.h"
#import "MERNavigationDelegate.h"
#import "SecondViewController.h"

@interface FirstViewController () <UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButton;
@property (nonatomic, strong) MERNavigationDelegate *navigationDelegate;
@property (nonatomic, strong) UIButton *customButton;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 24)];
    self.customButton.backgroundColor = [UIColor yellowColor];
    [self.customButton addTarget:self action:@selector(rightBarButtonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBarButton.customView = self.customButton;
    

}

- (void)rightBarButtonDidPressed:(UIButton *)button {
    CGPoint startingPoint = [self.customButton.superview convertPoint:self.customButton.center toView:nil];
    self.navigationDelegate.startingPoint = startingPoint;
    
    SecondViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self.navigationDelegate setPopGestureRecognizerToViewController:controller];
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (MERNavigationDelegate *)navigationDelegate {
    if (!_navigationDelegate) {
        _navigationDelegate = [[MERNavigationDelegate alloc] init];
        self.navigationController.delegate = _navigationDelegate;
    }
    return _navigationDelegate;
}

@end
