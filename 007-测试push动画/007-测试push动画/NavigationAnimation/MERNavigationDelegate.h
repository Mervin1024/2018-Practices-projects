//
//  MERNavigationDelegate.h
//  007-测试push动画
//
//  Created by 马遥 on 2018/1/27.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//@protocol MERNavigationAnimationDataSource <NSObject>
//
//- (CGPoint)startingPointWhenAnimationBegin;
//
//@end

@interface MERNavigationDelegate : NSObject <UINavigationControllerDelegate>

//@property (nonatomic, weak) id<MERNavigationAnimationDataSource> dataSource;

@property (nonatomic, assign) CGPoint startingPoint;

@end
