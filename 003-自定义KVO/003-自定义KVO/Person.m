//
//  Person.m
//  003-自定义KVO
//
//  Created by 马遥 on 2018/1/21.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)init {
    self = [super init];
    if (self) {
        _age = 0;
        _height = 150;
        _name = @"0";
    }
    return self;
}
@end
