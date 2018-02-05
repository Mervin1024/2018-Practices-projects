//
//  SecondViewController.m
//  008-用present动画来制作伪push动画
//
//  Created by 马遥 on 2018/2/5.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "SecondViewController.h"
#import "UINavigationBar+BackgroundColor.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"BBBBB";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed:)];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor greenColor]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancelButtonPressed:(UIBarButtonItem *)button {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
