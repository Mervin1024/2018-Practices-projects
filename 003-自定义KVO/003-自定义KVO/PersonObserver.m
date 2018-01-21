//
//  PersonObserver.m
//  003-自定义KVO
//
//  Created by 马遥 on 2018/1/21.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "PersonObserver.h"

@implementation PersonObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSString *str = [NSString stringWithFormat:@"{\n%@\n%@\n%@}",keyPath,object,change[NSKeyValueChangeNewKey]];
    NSLog(@"PersonObserver : ==========  %@",str);
}

@end
