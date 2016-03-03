//
//  NSString+RegularString.h
//  usedCar
//
//  Created by wufd on 14-7-10.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UjhConfig.h"

//正则表达式 --- 加密解密

@interface NSString (RegularString)

//手机号验证
+ (BOOL)isPhoneNumWithString:(NSString *)string;

//身份证号验证
+ (BOOL)isIdCardNumWithString:(NSString *)string;

// HMAC-Sha1 加密
+ (NSString *)hmacSha1:(NSString *)secret content:(NSString *)text;


// HMAC-MD5 加密
+ (NSString *)hmacMD5:(NSString *)secret content:(NSString *)text;

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string
                                                     pStr:(NSString *)pstr
                                                    Color:(UIColor *)color
                                                   pColor:(UIColor *)pcolor
                                                 fontSize:(CGFloat)fsize
                                                pfontSize:(CGFloat)pfsize;

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string
                                                    Color:(UIColor *)color
                                                 fontSize:(CGFloat)fsize;

//更新订单状态的frame
+ (CGSize)sizeOfLabelWithString:(NSString *)string font:(UIFont *)font;

+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate;

//格式时间
+ (NSString *)matterTime:(NSNumber *)time;
/**
 *  根据中国时区格式化时间: nowDate默认nil ; format默认@"yyyy-MM-dd HH:mm:ss"
 *
 *  @param nowDate date 默认nil，当前时间[NSDate date]
 *  @param format  格式化格式 默认@"yyyy-MM-dd HH:mm:ss"
 *
 *  @return 格式化字符串
 */
+(NSString *)DateFormatterNowDate:(NSDate *)nowDate DateFormat:(NSString *)format;


#pragma mark - 格式化数字12，123.12
/**
 *  格式化数字。保留两位小数
 *
 *  @param num 欲处理的数字
 *
 *  @return 逗号分隔的处理结果
 */
+ (NSString *)formatNum:(NSNumber *)num;
/**
 *  格式化数字。保留小数点的位数
 *
 *  @param string 欲处理的数字String
 *
 *  @return 逗号分隔的处理结果
 */
+ (NSString *)formatNumWithString:(NSString *)string;

/**
 *  判断字符串是否为空（标准不等于nil和@“”）
 *
 *  @param msg 欲判断的参数
 *
 *  @return yes空
 */
+ (BOOL)isEmpty:(NSString *)msg;
- (BOOL)isEmpty;
@end
