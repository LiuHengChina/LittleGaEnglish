//
//  NSURL+Parameters.m
//  NSURL+Parameters
//
//  Created by Carl Jahn on 16.09.13.
//  Copyright (c) 2013 Carl Jahn. All rights reserved.
//

#import "NSURL+Parameters.h"
#import <objc/runtime.h>

static void *kURLParametersDictionaryKey;

@implementation NSURL (Parameters)

- (void)scanParameters {

    if (self.isFileURL) {
        return;
    }

    NSScanner *scanner = [NSScanner scannerWithString:self.absoluteString];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"&?"]];
    //skip to ?
    [scanner scanUpToString:@"?" intoString:nil];


    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSString *tmpValue;
    while ([scanner scanUpToString:@"&" intoString:&tmpValue]) {

        NSArray *components = [tmpValue componentsSeparatedByString:@"="];

        if (components.count >= 2) {
            NSString *key = [components[0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

            NSString *str = components[1];
            NSString *value = [self decodeFromPercentEscapeString:str];

            if (!parameters[key]) {
                NSMutableArray *array = [NSMutableArray new];
                if (value) {
                    [array addObject:value];
                }
                parameters[key] = array;
            } else {
                NSMutableArray *array = parameters[key];
                [array addObject:value];
            }
        }
    }

    self.parameters = parameters;
}

- (id)objectForKeyedSubscript:(id)key {
    return self.parameters[key];
}


- (NSString *)parameterForKey:(NSString *)key {
    NSArray *array = self.parameters[key];
    if (array.count > 0) {
        return array.lastObject;
    }
    return 0;
}

- (NSArray *)parametersForKey:(NSString *)key {
    return self.parameters[key];
}

- (NSDictionary *)parameters {

    NSDictionary *result = objc_getAssociatedObject(self, &kURLParametersDictionaryKey);

    if (!result) {
        [self scanParameters];
    }

    return objc_getAssociatedObject(self, &kURLParametersDictionaryKey);
}

- (void)setParameters:(NSDictionary *)parameters {

    objc_setAssociatedObject(self, &kURLParametersDictionaryKey, parameters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (NSString *)decodeFromPercentEscapeString:(NSString *)input {
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];

    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


@end
