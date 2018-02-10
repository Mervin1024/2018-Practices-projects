//
//  UIView+MERUICreator.m
//  009-链式UI控件创建
//
//  Created by 马遥 on 2018/2/11.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "UIView+MERUICreator.h"

@implementation UIView (MERUICreator)

- (UIView *(^)(CGFloat))mer_width {
    return ^id(CGFloat width){
        CGRect rect = self.frame;
        rect.size.width = width;
        self.frame = rect;
        return self;
    };
}

- (UIView *(^)(CGFloat))mer_height {
    return ^id(CGFloat height){
        CGRect rect = self.frame;
        rect.size.height = height;
        self.frame = rect;
        return self;
    };
}

- (UIView *(^)(CGSize))mer_size {
    return ^id(CGSize size){
        CGRect rect = self.frame;
        rect.size = size;
        self.frame = rect;
        return self;
    };
}

- (UIView *(^)(CGRect))mer_frame {
    return ^id(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGPoint))mer_center {
    return ^id(CGPoint center){
        self.center = center;
        return self;
    };
}

- (UIView *(^)(UIColor *))mer_backgroundColor {
    return ^id(UIColor *backgroundColor){
        self.backgroundColor = backgroundColor;
        return self;
    };
}

- (UIView *(^)(CGFloat))mer_cornerRadius {
    return ^id(CGFloat cornerRadius){
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}

- (UIView *(^)(BOOL))mer_masksToBounds {
    return ^id(BOOL masksToBounds){
        self.layer.masksToBounds = masksToBounds;
        return self;
    };
}

@end
