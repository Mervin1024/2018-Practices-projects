//
//  UILabel+MERUICreator.m
//  009-链式UI控件创建
//
//  Created by 马遥 on 2018/2/11.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "UILabel+MERUICreator.h"

@implementation UILabel (MERUICreator)

- (UILabel *(^)(NSString *))mer_text {
    return ^id(NSString *text){
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(UIFont *))mer_font {
    return ^id(UIFont *font){
        self.font = font;
        return self;
    };
}

@end
