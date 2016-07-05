//
//  CBNChannelColumnRequest.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBaseNetworkAction.h"

@interface CBNChannelColumnRequest : CBNBaseNetworkAction
/*
 *  获取频道请求连接
 */
+ (NSString *)getChannelColumnURL;
/*
 *  获取频道请求参数
 */
+ (NSDictionary *)getChannelColumnParameters;
@end
