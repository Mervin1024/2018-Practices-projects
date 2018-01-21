//
//  ViewController.m
//  003-自定义KVO
//
//  Created by 马遥 on 2018/1/21.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+MERNotifying.h"
#import "PersonObserver.h"
#import "Person.h"

@interface ViewController ()
@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) PersonObserver *personObserver;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [[Person alloc] init];
    self.personObserver = [[PersonObserver alloc] init];
    [self.person addMERObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    [self.person addMERObserver:self.personObserver forKeyPath:@"height" options:NSKeyValueObservingOptionNew context:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.person.age ++;
    self.person.height --;
    self.person.name = [NSString stringWithFormat:@"%@ ====== %@",@(self.person.age), @(self.person.height)];
    NSLog(@"touchesBegan : ===========  %@",self.person.name);
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"KeyPath : %@ ============= %@",keyPath,change[NSKeyValueChangeNewKey]);
}


@end
