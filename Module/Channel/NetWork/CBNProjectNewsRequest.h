//
//  CBNProjectNewsRequest.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBaseNetworkAction.h"
#import "CBNProjectNewsItemModel.h"



@interface CBNProjectNewsRequest : CBNBaseNetworkAction
/*
 *  获取频道请求连接
 */
+ (NSString *)getProjectNewsURL;
/*
 *  获取频道请求参数
 */
+ (NSDictionary *)getProjectNewsParameters;

/*
 *  刷新
 */
+ (void)refreshProjectFromSeverSuccess:(void (^)(NSMutableArray *projectModelArray))projectModelArray failed:(void (^)(NSString *errorStr))errorStr;

/*
 *  加载更多
 */
+ (void)loadMoreProjectFromSeverSuccess:(void (^)(NSMutableArray *projectModelArray))projectModelArray failed:(void (^)(NSString *errorStr))errorStr;

@end
