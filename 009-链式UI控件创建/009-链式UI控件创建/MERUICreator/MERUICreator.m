//
//  MERUICreator.m
//  009-链式UI控件创建
//
//  Created by 马遥 on 2018/2/11.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "MERUICreator.h"

@implementation MERUICreator

+ (UILabel *)createLabel {
    return [[UILabel alloc] init];
}

+ (UIButton *)createButton {
    return [self createButton:UIButtonTypeSystem];
}

+ (UIButton *)createButton:(UIButtonType)buttonType {
    return [UIButton buttonWithType:buttonType];
}

@end
