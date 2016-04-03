//
//  NSString+RegularString.m
//  usedCar
//
//  Created by wufd on 14-7-10.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import "NSString+RegularString.h"
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>
#import <UIKit/UIKit.h>
#import "UIColor+Category.h"


@implementation NSString (RegularString)
#pragma mark - 手机号码 的 正则表达式
+ (BOOL)isPhoneNumWithString:(NSString *)string {
    //号码规则
    NSString *phoneNumString = nil;
//    phoneNumString = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    phoneNumString = @"^1\\d{10}$";

    //移动
    NSString *YDPhoneNumString = nil;
    YDPhoneNumString = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";

    //联通
    NSString *LTPhoneNumString = nil;
    LTPhoneNumString = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";

    //电信
    NSString *DXPhoneNumString = nil;
    DXPhoneNumString = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";

    NSPredicate *regextestPhoneNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneNumString];
    NSPredicate *regextestYDPhoneNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", YDPhoneNumString];
    NSPredicate *regextestLTPhoneNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", LTPhoneNumString];
    NSPredicate *regextestDXPhoneNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", DXPhoneNumString];

    if (([regextestPhoneNum evaluateWithObject:string] == YES)
            || ([regextestYDPhoneNum evaluateWithObject:string] == YES)
            || ([regextestLTPhoneNum evaluateWithObject:string] == YES)
            || ([regextestDXPhoneNum evaluateWithObject:string] == YES)
            ) {
        return YES;
    }
    return NO;
}

#pragma mark - 身份证号码 的 正则表达式
+ (BOOL)isIdCardNumWithString:(NSString *)string {
    NSString *regex1 = @"^[1-9](\\d{14}|\\d{17})$";
    NSString *regex3 = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    NSString *regex4 = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{4}$";
    NSString *regex5 = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|[xX])$";
    NSString *regex2 = @"^(//d{14}|//d{17})(//d[0-9]|[xX])$";

    NSPredicate *identityCardPredicate1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];

    NSPredicate *identityCardPredicate2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
    NSPredicate *identityCardPredicate3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex3];
    NSPredicate *identityCardPredicate4 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex4];
    NSPredicate *identityCardPredicate5 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex5];

    if ([identityCardPredicate1 evaluateWithObject:string] == YES
            || [identityCardPredicate2 evaluateWithObject:string] == YES
            || [identityCardPredicate3 evaluateWithObject:string] == YES
            || [identityCardPredicate4 evaluateWithObject:string] == YES
            || [identityCardPredicate5 evaluateWithObject:string] == YES
            ) {
        return YES;
    }
    return NO;
}

#pragma  mark - 加密
+ (NSString *)hmacSha1:(NSString *)secret content:(NSString *)text {
    const char *cKey = [secret cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [text cStringUsingEncoding:NSUTF8StringEncoding];

    uint8_t cHMAC[CC_SHA1_DIGEST_LENGTH];

    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);

    //NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
    NSString *hash;
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];

    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", cHMAC[i]];
    hash = output;
    return hash;
}

+ (NSString *)hmacMD5:(NSString *)secret content:(NSString *)text {
    const char *cKey = [secret cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [text cStringUsingEncoding:NSUTF8StringEncoding];

    uint8_t cHMAC[CC_MD5_DIGEST_LENGTH];

    CCHmac(kCCHmacAlgMD5, cKey, strlen(cKey), cData, strlen(cData), cHMAC);

    NSString *hash;
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", cHMAC[i]];
    }
    hash = output;
    return hash;
}

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string
                                                     pStr:(NSString *)pstr
                                                    Color:(UIColor *)color
                                                   pColor:(UIColor *)pcolor
                                                 fontSize:(CGFloat)fsize
                                                pfontSize:(CGFloat)pfsize {
    if (!string) {
        string = @"";
    }
    if (!pstr) {
        pstr = @"";
    }
    if (!color) {
        color = [UIColor blackColor];
    }
    if (!pcolor) {
        pcolor = [UIColor blackColor];
    }
    if (fsize <= 0) {
        fsize = 12;
    }
    if (pfsize <= 0) {
        pfsize = 12;
    }

    NSMutableAttributedString * attString = [NSString attributedStringWithString:string Color:color fontSize:fsize];
    NSMutableAttributedString * attPString = [NSString attributedStringWithString:pstr Color:pcolor fontSize:pfsize];
    [attPString appendAttributedString:attString];
    return attPString;
}

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string
                                                    Color:(UIColor *)color
                                                 fontSize:(CGFloat)fsize {
    if (!string) {
        string = @"";
    }
    if (!color) {
        color = [UIColor blackColor];
    }
    if (fsize<=0) {
        fsize = 12;
    }
    NSMutableAttributedString * attString1 = [[NSMutableAttributedString alloc]initWithString:string];
    NSRange amountRange = NSMakeRange(0, attString1.length);
    
    [attString1 beginEditing];
    
    //字体大小
    [attString1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fsize] range:amountRange];
    //字体颜色
    [attString1 addAttribute:NSForegroundColorAttributeName value:color range:amountRange];
    
    /*
     NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
     paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
     paragraphStyle.alignment = NSTextAlignmentLeft;
     NSDictionary * attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:fsize],
     NSParagraphStyleAttributeName : paragraphStyle};
     [attString1 addAttributes:attributes range:amountRange];
     */
    
    [attString1 endEditing];
    return attString1;
}

+ (CGSize)sizeOfLabelWithString:(NSString *)string font:(UIFont *)font {

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentLeft;

    NSDictionary *attributes = @{NSFontAttributeName : font,
            NSParagraphStyleAttributeName : paragraphStyle};


    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range;
    range.location = 0;
    range.length = attrStr.length;
    [attrStr addAttributes:attributes range:range];

    CGSize contentSize = [attrStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;

    return contentSize;
}

+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate {
    //设置源日期时区
    NSTimeZone *sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//UTC或GMT
    //设置转换后的目标日期时区
    NSTimeZone *destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate *destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

//格式时间
+ (NSString *)matterTime:(NSNumber *)time {
    NSTimeInterval timeInterval = [time doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];

    NSDateFormatter *dateMatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateMatter setTimeZone:timeZone];
    NSLocale *location = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateMatter setLocale:location];

    [dateMatter setDateFormat:@"yyyy.MM.dd HH:mm"];
    return [NSString stringWithFormat:@"%@", [dateMatter stringFromDate:date]];
}

+(NSString *)DateFormatterNowDate:(NSDate *)nowDate DateFormat:(NSString *)format{
    NSDate * date = nowDate;
    if (!nowDate) {
        date = [NSDate date];
    }
    NSString * dateForMat = format;
    if (!format || [format isEqualToString:@""]) {
        dateForMat = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDateFormatter * dateformatter = [[NSDateFormatter alloc]init];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateformatter setTimeZone:timeZone];
    NSLocale * location = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    [dateformatter setLocale:location];
    [dateformatter setDateFormat:dateForMat];
    
    return [dateformatter stringFromDate:date];
}


#pragma mark - 格式化数字12，123.12
+ (NSString *)formatNum:(NSNumber *)num {
    NSString * result = nil;
    if (!num) {
        return @"";
    }
    NSArray * array = [[NSString stringWithFormat:@"%.2f",[num doubleValue]] componentsSeparatedByString:@"."];
    NSMutableArray * resultArray = [NSMutableArray array];
    for (NSString * objStr in array) {
        [resultArray addObject:[NSString manageFormatNumStr:[NSString stringWithFormat:@"%@",objStr]]];
    }
    result = [resultArray componentsJoinedByString:@"."];
    
    return result;
}

+ (NSString *)formatNumWithString:(NSString *)string{
    NSString * result = nil;
    if (!string) {
        return @"";
    }
    NSRange pointRange = [string rangeOfString:@"."];
    if (pointRange.location != NSNotFound) {
        NSArray * array = [[NSString stringWithFormat:@"%@",string] componentsSeparatedByString:@"."];
        NSMutableArray * resultArray = [NSMutableArray array];
        for (NSString * objStr in array) {
            [resultArray addObject:[NSString manageFormatNumStr:[NSString stringWithFormat:@"%@",objStr]]];
        }
        result = [resultArray componentsJoinedByString:@"."];
        return result;
    }else{
        result = [NSString stringWithFormat:@"%@",string];
        return [NSString manageFormatNumStr:result];
    }
    return result;
}

+(NSString *)manageFormatNumStr:(NSString *)string {
    NSString * result = nil;
    if (!string) {
        return @"";
    }
    
    NSString * symbolStr = @"";
    if ([string rangeOfString:@"-"].location != NSNotFound) {
        symbolStr = @"-";
        string = [[string componentsSeparatedByString:@"-"] lastObject];
    }
    
    long numL = string.length;
    long count = numL/3;
    int crc = (int)numL%3;
    NSMutableString * zeroStr = [NSMutableString stringWithFormat:@""];
    if (crc!=0) {
        for (int i = 0; i<(3-crc); i++) {
            [zeroStr appendString:@"0"];
        }
    }
    result = [NSString stringWithFormat:@"%@%@",zeroStr,string];
    
    NSMutableArray * itemArray = [NSMutableArray array];
    long for_count = count;
    if (crc!=0) {
        for_count = (count+1);
    }
    for (long i = 0; i < for_count; i++) {
        NSRange range = NSMakeRange(i*3, 3);
        [itemArray addObject:[result substringWithRange:range]];
    }
    if (crc!=0) {
        result = [[itemArray componentsJoinedByString:@","] substringFromIndex:(3-crc)];
    }else{
        result = [itemArray componentsJoinedByString:@","];
    }
    
    return [NSString stringWithFormat:@"%@%@",symbolStr,result];
}


+(NSString*)TimeformatFromSeconds:(NSInteger)seconds
{
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    return format_time;
}

+ (BOOL)isEmpty:(NSString *)msg {
    if (msg && ![msg isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

- (BOOL)isEmpty {
    return [NSString isEmpty:self];
}


/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


+ (NSString *)getDateNow
{
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSWeekdayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger year=[comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    return [NSString stringWithFormat:@"%ld年%ld月%ld日",(long)year,(long)month,(long)day];
}

+ (NSString *)getWeekNow
{
    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSWeekdayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];

    return [NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:week-1]];
}

+ (NSString *)weibaStr:(NSString *)str
{
    return [NSString stringWithFormat:@"#%@#",str];
}


+ (NSString *)formatWithInter:(NSInteger)time
{
    NSString *tmphh = [NSString stringWithFormat:@"%ld",time/3600];
    if ([tmphh length] == 1)
    {
        tmphh = [NSString stringWithFormat:@"0%@",tmphh];
    }
    NSString *tmpmm = [NSString stringWithFormat:@"%ld",(time/60)%60];
    if ([tmpmm length] == 1)
    {
        tmpmm = [NSString stringWithFormat:@"0%@",tmpmm];
    }
    NSString *tmpss = [NSString stringWithFormat:@"%ld",time%60];
    if ([tmpss length] == 1)
    {
        tmpss = [NSString stringWithFormat:@"0%@",tmpss];
    }
    return [NSString stringWithFormat:@"%@:%@:%@",tmphh,tmpmm,tmpss]; 
}

@end
