//
//  CBNChannelColumnRequest.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNChannelColumnRequest.h"
#define URL_Key_Word @"Column"
@implementation CBNChannelColumnRequest
/*
 *  获取频道请求连接
 */
+ (NSString *)getChannelColumnURL
{
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@",sever_URL,URL_Key_Word,Index];

    return urlString;
}
/*
 *  获取频道请求参数
 */
+ (NSDictionary *)getChannelColumnParameters
{
    
    NSString *secretStr = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@",secret_key,Index]];
    
    NSString *secretStr2 = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@",URL_Key_Word,secret_key]];
    
    NSMutableDictionary *parDic = [[NSMutableDictionary alloc] init];
    
    [parDic setObject:secretStr forKey:request_Key];
    
    [parDic setObject:secretStr2 forKey:request_Set_Key];
    
    return parDic;
    
}
@end
