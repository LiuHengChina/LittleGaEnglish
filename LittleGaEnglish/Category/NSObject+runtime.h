//
//  NSObject+runtime.h
//  runTimeTest
//
//  Created by Jed on 15/11/5.
//  Copyright © 2015年 Jed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (runtime)

// 交换方法内部实现
- (void)exchangeClassSelector:(SEL)originalSelector with:(SEL)swizzledSelector class:(Class)replaceClass;


@end
