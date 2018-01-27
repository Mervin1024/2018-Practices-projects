//
//  FirstViewController.m
//  007-测试push动画
//
//  Created by 马遥 on 2018/1/26.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "FirstViewController.h"
#import "MERNavigationDelegate.h"
#import <objc/runtime.h>

@interface FirstViewController () <UINavigationControllerDelegate>
@property (nonatomic, strong) MERNavigationDelegate *navigationDelegate;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationDelegate = [[MERNavigationDelegate alloc] init];
    self.navigationController.delegate = self.navigationDelegate;
    
    NSLog(@"%@",self.navigationController.navigationBar.subviews);
    
    unsigned int count = 0;
    Ivar *ivarList;
    ivarList = class_copyIvarList([self.navigationController.navigationBar class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSLog(@"方法名称：%s， 方法类型：%s  ",ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    }
    free(ivarList);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"RightBarButtonItemPressed"]) {
        NSLog(@"动画起始点为 %@", NSStringFromCGPoint(self.view.center));
    }
}

@end
