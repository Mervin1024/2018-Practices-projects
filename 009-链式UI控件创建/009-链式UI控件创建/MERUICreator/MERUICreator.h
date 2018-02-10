//
//  MERUICreator.h
//  009-链式UI控件创建
//
//  Created by 马遥 on 2018/2/11.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MERCategroiesHeader.h"

@interface MERUICreator : NSObject

+ (UILabel *)createLabel;

+ (UIButton *)createButton;
+ (UIButton *)createButton:(UIButtonType)buttonType;

@end
