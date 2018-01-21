//
//  NSObject+MERNotifying.m
//  003-自定义KVO
//
//  Created by 马遥 on 2018/1/21.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "NSObject+MERNotifying.h"
#import <objc/runtime.h>
#import <objc/message.h>

static const char *MERObserverInfoArray;
static NSString *MERClassPrefix = @"MERKVONotifying_";

@implementation NSObject (MERNotifying)

- (void)addMERObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    if (keyPath.length == 0) {
        return;
    }
    /***************** 创建新类(检查是否重复创建) *****************/
    Class newClass = [self createMERObserverClassFromClass:object_getClass(self)];
    
    /***************** 重写setter方法 *****************/
    //根据keyPath获得setter方法名称
    NSString *firstLette = [keyPath substringToIndex:1];
    NSString *selectorName = [NSString stringWithFormat:@"%@%@",[firstLette uppercaseString],[keyPath substringFromIndex:1]];
    selectorName = [NSString stringWithFormat:@"set%@:",selectorName];
    //判断该属性类型是否为OC类型
    Class superClass = class_getSuperclass(object_getClass(self));
    Method setterMethod = class_getInstanceMethod(superClass, NSSelectorFromString(selectorName));
    BOOL hasObjectType = [self hasObjectiveClassParameterFromMethod:setterMethod];
    if (hasObjectType) {
        class_addMethod(newClass, NSSelectorFromString(selectorName), (IMP)mer_setNewOCProperty, "v@:");
    } else {
        class_addMethod(newClass, NSSelectorFromString(selectorName), (IMP)mer_setNewCountProperty, "v@:");
    }
    
    id oc_context = (__bridge id)context;
    if (oc_context == nil) {
        oc_context = [NSNull null];
    }
    NSDictionary *info = @{@"observer":observer,@"keyPath":keyPath,@"context":oc_context};
    NSMutableArray *infoArray = objc_getAssociatedObject(self, MERObserverInfoArray);
    if (infoArray) {
        [infoArray addObject:info];
    } else {
        infoArray = [NSMutableArray arrayWithObject:info];
    }
    objc_setAssociatedObject(self, MERObserverInfoArray, infoArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

#pragma mark - 创建新类

- (Class)createMERObserverClassFromClass:(Class)class {
    Class newClass = class;
    NSString *oldClassString = NSStringFromClass(class);
    if (![oldClassString hasPrefix:MERClassPrefix]) {
        NSString *newClassString = [NSString stringWithFormat:@"%@%@",MERClassPrefix,oldClassString];
        const char *name = [newClassString UTF8String];
        newClass = objc_lookUpClass(name);
        if (newClass == nil) {
            newClass = objc_allocateClassPair(object_getClass(self), name, 0);
            objc_registerClassPair(newClass);
            object_setClass(self, newClass);
            // 重写class方法
            class_addMethod(newClass, @selector(class), (IMP)mer_class, "#@");
        }
    }
    return newClass;
}

- (BOOL)hasObjectiveClassParameterFromMethod:(Method)method {
    const char *typeEncoding = method_getTypeEncoding(method);
    NSCharacterSet *setToRemove = [[NSCharacterSet characterSetWithCharactersInString:@"cislqCISLQfdBv*@#:{}[]()b^?"] invertedSet];
    NSString *methodType = [[[NSString stringWithUTF8String:typeEncoding] componentsSeparatedByCharactersInSet:setToRemove] componentsJoinedByString:@""];
    NSRange colonRange = [methodType rangeOfString:@":"];
    if (colonRange.location != NSNotFound) {
        NSString * parameterString = [methodType substringFromIndex:(colonRange.location+colonRange.length)];
        NSCharacterSet *parameterSetToRemove = [[NSCharacterSet characterSetWithCharactersInString:@"cislqCISLQfdbB"] invertedSet];
        parameterString = [[parameterString componentsSeparatedByCharactersInSet:parameterSetToRemove] componentsJoinedByString:@""];
        return parameterString.length == 0;
    }
    return YES;
}

#pragma mark - C 语言函数

static Class mer_class (id self ,SEL cmd) {
    return class_getSuperclass(object_getClass(self));
}

void mer_setNewOCProperty (id self ,SEL cmd, id newValue) {
    // 调用父类setter方法
    NSString *selectorName = NSStringFromSelector(cmd);
    NSLog(@"走到新方法啦  🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶 %@",selectorName);
    Class superClass = class_getSuperclass(object_getClass(self));
    struct objc_super superStruct = {
        self,
        superClass

    };
    objc_msgSendSuper(&superStruct,cmd,newValue);
    
    // 通知Observe
    NSMutableArray *infoArray = objc_getAssociatedObject(self, MERObserverInfoArray);
    if (infoArray.count == 0) {
        return;
    }
    for (NSDictionary *info in infoArray) {
        NSObject *observer = info[@"observer"];
        NSString *keyPath = info[@"keyPath"];
        id context = info[@"context"];
        if ([context isEqual:[NSNull null]]) {
            context = nil;
        }
        if ([observer respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)]) {
            [observer observeValueForKeyPath:keyPath ofObject:self change:@{NSKeyValueChangeNewKey:newValue} context:(__bridge void*)context];
            
        }
    }
}

void mer_setNewCountProperty (id self ,SEL cmd, float newValue) {
    // 调用父类setter方法
    NSString *selectorName = NSStringFromSelector(cmd);
    NSLog(@"走到新方法啦  🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶🌶 %@",selectorName);
    Class superClass = class_getSuperclass(object_getClass(self));
    struct objc_super superStruct = {
        self,
        superClass
        
    };
    objc_msgSendSuper(&superStruct,cmd,newValue);
    
    // 通知Observe
    NSMutableArray *infoArray = objc_getAssociatedObject(self, MERObserverInfoArray);
    if (infoArray.count == 0) {
        return;
    }
    for (NSDictionary *info in infoArray) {
        NSString *keyPath = info[@"keyPath"];
        if (![selectorName hasSuffix:[[keyPath substringFromIndex:1] stringByAppendingString:@":"]]) {
            continue;
        }
        NSObject *observer = info[@"observer"];
        id context = info[@"context"];
        if ([context isEqual:[NSNull null]]) {
            context = nil;
        }
        if ([observer respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)]) {
            [observer observeValueForKeyPath:keyPath ofObject:self change:@{NSKeyValueChangeNewKey:@(newValue)} context:(__bridge void*)context];
            
        }
    }
}


@end
