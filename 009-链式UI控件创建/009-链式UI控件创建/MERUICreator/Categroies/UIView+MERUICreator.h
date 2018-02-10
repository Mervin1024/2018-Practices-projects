//
//  UIView+MERUICreator.h
//  009-链式UI控件创建
//
//  Created by 马遥 on 2018/2/11.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MERUICreator)

- (UIView *(^)(CGFloat))mer_width;
- (UIView *(^)(CGFloat))mer_height;
- (UIView *(^)(CGSize))mer_size;
- (UIView *(^)(CGRect))mer_frame;
- (UIView *(^)(CGPoint))mer_center;

- (UIView *(^)(UIColor *))mer_backgroundColor;

- (UIView *(^)(CGFloat))mer_cornerRadius;
- (UIView *(^)(BOOL))mer_masksToBounds;

@end
