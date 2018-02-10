//
//  UILabel+MERUICreator.h
//  009-链式UI控件创建
//
//  Created by 马遥 on 2018/2/11.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MERUICreator)

// override

- (UILabel *(^)(CGFloat))mer_width;
- (UILabel *(^)(CGFloat))mer_height;
- (UILabel *(^)(CGSize))mer_size;
- (UILabel *(^)(CGRect))mer_frame;
- (UILabel *(^)(CGPoint))mer_center;

- (UILabel *(^)(UIColor *))mer_backgroundColor;

- (UILabel *(^)(CGFloat))mer_cornerRadius;
- (UILabel *(^)(BOOL))mer_masksToBounds;


// new
- (UILabel *(^)(NSString *))mer_text;
- (UILabel *(^)(UIFont *))mer_font;

@end
