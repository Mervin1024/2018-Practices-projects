//
//  ViewController.m
//  001-pThread初尝试
//
//  Created by 马遥 on 2018/1/8.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self pThreadDemo];
}

- (void)pThreadDemo {
    /**
     创建方法：
     pthread_create(pthread_t  _Nullable *restrict _Nonnull, const pthread_attr_t *restrict _Nullable, void * _Nullable (* _Nonnull)(void * _Nullable), void *restrict _Nullable)
     
     参数：
     1.指向线程代号的指针
     2.线程属性
     3.需要调用的函数指针
=================================================
     void *     (*)     (void *)
     返回值     函数指针     参数
     
     
     void * 等价于 OC中的 id 类型，表任意类型
=================================================
     
     4.传递给函数的参数
     
     返回值：
     0 表示正确，非 0 标识错误代码
     */
    pthread_t threadId;
    NSString *str = @"hello pThread!";
    
    int result = pthread_create(&threadId, NULL, &demo, (__bridge void *)(str));
    if (result == 0) {
        NSLog(@"成功");
    } else {
        NSLog(@"失败了 ：%@",@(result));
    }
}

void * demo(void *param) {
    NSLog(@"%@ 所在线程：%@",param,[NSThread currentThread]);
    return NULL;
}


@end
