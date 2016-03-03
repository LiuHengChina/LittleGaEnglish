//
//  NSObject+runtime.m
//  runTimeTest
//
//  Created by Jed on 15/11/5.
//  Copyright © 2015年 Jed. All rights reserved.
//

#import "NSObject+runtime.h"
#import <objc/runtime.h>
//#import "UIFont+myFont.h"

@implementation NSObject (runtime)


- (void)exchangeClassSelector:(SEL)originalSelector with:(SEL)swizzledSelector class:(Class)replaceClass
{
    
    Method originalMethod = class_getInstanceMethod(replaceClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(replaceClass, swizzledSelector);
    
    if (!originalMethod) {
        originalMethod = class_getClassMethod(replaceClass, originalSelector);
    }
    if (!swizzledMethod) {
        swizzledMethod = class_getClassMethod(replaceClass, swizzledSelector);
    }
    // 只是将两个方法的内部实现做交换
    method_exchangeImplementations(originalMethod, swizzledMethod);

}


@end
