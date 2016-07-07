//
//  CBNPublicChannelNewsRequest.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/6.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBNProjectNewsRequest.h"

typedef void(^loadDataSecuessed)(id result);
typedef void(^loadDataFailed)(NSError *error);

@interface CBNPublicChannelNewsRequest : NSObject<NSURLConnectionDataDelegate>
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *receiveData;
- (NSString *)getProjectNewsURL;

- (NSDictionary *)getProjectNewsParametersWithChannelModel:(CBNChannelColumnModel *)channelModel andPage:(NSString *)page pageCount:(NSString *)pageCount;

- (void)loadPublicChannelNewsWithParameterDic:(NSDictionary *)parameterDic loadDataSecuessed:(loadDataSecuessed)loadDataSecuessed loadDataFailed:(loadDataFailed)loadDataFailed;
@end
