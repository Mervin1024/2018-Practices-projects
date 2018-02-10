//
//  ViewController.m
//  009-链式UI控件创建
//
//  Created by 马遥 on 2018/2/11.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "ViewController.h"
#import "MERUICreator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label =
    MERUICreator.createLabel
    .mer_size(CGSizeMake(100, 40))
    .mer_center(self.view.center)
    .mer_text(@"这是测试");
    label.mer_backgroundColor([UIColor blueColor]).mer_cornerRadius(10);
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label];
    NSLog(@"%@",label);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
