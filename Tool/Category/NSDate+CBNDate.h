//
//  NSDate+CBNDate.h
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CBNDate)
/*
 *  取秒差
 */
+ (NSString *)getUTCFormateDate:(NSString *)newsDate;
/*
 *  字符串转换成标准时间
 */
+ (NSDate *)stringDateChangeToStandardDateWithString:(NSString *)dateString;
+ (NSDate *)yearDayMonthChangeToStandardDateWithString:(NSString *)dateString;
/*
 *  标准时间转成想要的字符串时间
 */
+ (NSString *)standardDateChangeToNeedTime:(NSDate *)date;
+ (NSString *)pointStandardDateChangeToNeedTime:(NSString *)dateString;
@end
