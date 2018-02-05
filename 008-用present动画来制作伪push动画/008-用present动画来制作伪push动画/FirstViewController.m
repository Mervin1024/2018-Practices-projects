//
//  FirstViewController.m
//  008-用present动画来制作伪push动画
//
//  Created by 马遥 on 2018/2/5.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "MERDiffusePresentationManager.h"
#import "UINavigationBar+BackgroundColor.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButton;
@property (nonatomic, strong) UIButton *customButton;
@property (nonatomic, strong) MERDiffusePresentationManager *diffusePresentationManager;

@property (nonatomic, strong) UIView *navigationBackView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 24)];
    self.customButton.backgroundColor = self.view.backgroundColor;
    [self.customButton addTarget:self action:@selector(rightBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBarButton.customView = self.customButton;

    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor yellowColor]];
    self.navigationItem.title = @"AAAAAAAAAAAAAAAAAA";
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)rightBarButtonPressed:(id)sender {
    SecondViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SecondViewController"];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:controller];
    

    CGPoint startPoint = [self.customButton.superview convertPoint:self.customButton.center toView:nil];
    _diffusePresentationManager = [[MERDiffusePresentationManager alloc] initWithStartingPoint:startPoint];
    navi.modalPresentationStyle = UIModalPresentationCustom;
    navi.transitioningDelegate = _diffusePresentationManager;

    
    
    
    [self.navigationController presentViewController:navi animated:YES completion:nil];
}


@end
