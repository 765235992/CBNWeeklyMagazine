//
//  CBNBookShopRequest.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^loadDataSecuessed)(id result);
typedef void(^loadDataFailed)(NSError *error);
@interface CBNBookShopRequest : NSObject<NSURLConnectionDataDelegate>
@property (nonatomic, copy) loadDataSecuessed aLoadDataSecuessed;
@property (nonatomic, copy) loadDataFailed aLoadDataFailed;

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *receiveData;
- (NSString *)getBookShopURL;
- (NSDictionary *)getBookShopParametersWithYear:(NSString *)year andPage:(NSString *)page pageCount:(NSString *)pageCount;

- (void)loadBookShopWithParameterDic:(NSDictionary *)parameterDic loadDataSecuessed:(loadDataSecuessed)loadDataSecuessed loadDataFailed:(loadDataFailed)loadDataFailed;
@end
