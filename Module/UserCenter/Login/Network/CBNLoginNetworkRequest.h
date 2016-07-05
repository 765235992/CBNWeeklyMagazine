//
//  CBNLoginNetworkRequest.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/4.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBaseNetworkAction.h"

@interface CBNLoginNetworkRequest : CBNBaseNetworkAction
/*
 *  登录事件
 *
 *  userID 用户账号
 *
 *  userPassWord 用户密码
 *
 *  secuessed 登录成功返回值
 *
 *  failed  登录失败返回值
 *
 */
+ (void)loginEventWithUserID:(NSString *)userID userPassWord:(NSString *)userPassWord success:(void (^)(id result))loginSecuessed failed:(void (^)(NSError *error))loginFailed;

+ (void)loginOut;
@end
