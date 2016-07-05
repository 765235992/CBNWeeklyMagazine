//
//  CBNHomePageNewsRequest.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBaseNetworkAction.h"

@interface CBNHomePageNewsRequest : CBNBaseNetworkAction
@property (nonatomic, assign) NSInteger recommendCount;
/*
 *  使用单利，因为要全局使用
 */
+ (CBNHomePageNewsRequest *)sharedInstance;

/*
 *  获取频道请求连接
 */
+ (NSString *)getHomePageNewsURL;
/*
 *  获取频道请求参数
 */
+ (NSDictionary *)getHomePageNewsParameters;

/*
 *  刷新
 */
- (void)refreshHomePageNewsFromSeverWith:(NSInteger)page success:(void (^)(NSMutableArray *homePageModelrray,NSMutableArray *sliderArray))homePageModelrray failed:(void (^)(NSString *errorStr))errorStr;

/*
 *  加载更多
 */
- (void)loadMoreHomePageNewsFromSeverWith:(NSInteger)page success:(void (^)(NSMutableArray *homePageModelrray))homePageModelrray failed:(void (^)(NSString *errorStr))errorStr;
@end
