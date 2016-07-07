//
//  CBNTextNewsDetailRequest.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/6.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNTextNewsDetailRequest.h"

@implementation CBNTextNewsDetailRequest
/*
 *  获取新闻请求链接
 */
+ (NSString *)getDaymoreTextNewsDetailURL
{
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@",sever_URL,Daymore,@"index"];
    return urlString;
}
/*
 *  获取新闻请求参数
 */
+ (NSDictionary *)getDaymoreTextNewsDetailParametersWithChapt_ID:(NSString *)chapt_ID issue_ID:(NSString *)issue_ID
{
    NSString *secretStr = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@",secret_key,@"index"]];
    
    NSString *secretStr2 = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@%@",chapt_ID,issue_ID,secret_key]];
    
    NSMutableDictionary *parDic = [[NSMutableDictionary alloc] init];
    
    [parDic setObject:secretStr forKey:@"key"];
    [parDic setObject:secretStr2 forKey:@"setKey"];
    [parDic setObject:chapt_ID forKey:@"chapt_id"];
    [parDic setObject:issue_ID forKey:@"issue_id"];
    return parDic;
}

/*
 *  获取期刊新闻请求链接
 */
+ (NSString *)getNormalTextNewsDetailURL
{
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@",sever_URL,Index,GetArticle];
    return urlString;
}

/*
 *  获取期刊新闻请求参数
 */
+ (NSDictionary *)getNormalTextNewsDetailParametersWithChapt_ID:(NSString *)chapt_ID issue_ID:(NSString *)issue_ID
{
    NSString *secretStr = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@",secret_key,@"index"]];
    
    NSString *secretStr2 = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@%@",chapt_ID,issue_ID,secret_key]];
    
    NSMutableDictionary *parDic = [[NSMutableDictionary alloc] init];
    
    [parDic setObject:secretStr forKey:@"key"];
    [parDic setObject:secretStr2 forKey:@"setKey"];
    [parDic setObject:chapt_ID forKey:@"chapt_id"];
    [parDic setObject:issue_ID forKey:@"issue_id"];
    
    return parDic;
}
@end
