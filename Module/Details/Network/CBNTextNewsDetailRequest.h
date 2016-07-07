//
//  CBNTextNewsDetailRequest.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/6.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBaseNetworkAction.h"

@interface CBNTextNewsDetailRequest : CBNBaseNetworkAction
/*
 *  获取日更新闻请求链接
 */
+ (NSString *)getDaymoreTextNewsDetailURL;

/*
 *  获取日更新闻请求参数
 */
+ (NSDictionary *)getDaymoreTextNewsDetailParametersWithChapt_ID:(NSString *)chapt_ID issue_ID:(NSString *)issue_ID;

/*
 *  获取期刊新闻请求链接
 */
+ (NSString *)getNormalTextNewsDetailURL;

/*
 *  获取期刊新闻请求参数
 */
+ (NSDictionary *)getNormalTextNewsDetailParametersWithChapt_ID:(NSString *)chapt_ID issue_ID:(NSString *)issue_ID;

@end
