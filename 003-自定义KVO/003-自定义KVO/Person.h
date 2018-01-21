//
//  Person.h
//  003-自定义KVO
//
//  Created by 马遥 on 2018/1/21.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) float height;
@property (nonatomic, copy) NSString *name;
@end
