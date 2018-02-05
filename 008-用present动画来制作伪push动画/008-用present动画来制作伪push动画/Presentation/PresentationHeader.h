//
//  Header.h
//  boxfish-english
//
//  Created by 马遥 on 2017/11/29.
//  Copyright © 2017年 boxfish. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define Screen_Width  [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height

/**
 *  页面消失后的回调
 */
typedef void(^PresentationAfterDismiss)(void);

/**
 *  侧滑方向
 *
- BFESlidePresentationDirectionLeft:    由左侧滑入
- BFESlidePresentationDirectionTop:     由顶部滑入
- BFESlidePresentationDirectionRight:   由右侧滑入
- BFESlidePresentationDirectionBottom:  由底部滑入， 默认以此模式， 类似于 ActionSheet
 */
typedef NS_ENUM(NSUInteger, BFESlidePresentationDirection) {
    BFESlidePresentationDirectionLeft,
    BFESlidePresentationDirectionTop,
    BFESlidePresentationDirectionRight,
    BFESlidePresentationDirectionBottom
};

#endif /* Header_h */
