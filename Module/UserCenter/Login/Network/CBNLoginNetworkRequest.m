//
//  CBNLoginNetworkRequest.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/4.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNLoginNetworkRequest.h"

@implementation CBNLoginNetworkRequest
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
+ (void)loginEventWithUserID:(NSString *)userID userPassWord:(NSString *)userPassWord success:(void (^)(id result))loginSecuessed failed:(void (^)(NSError *error))loginFailed
{
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    
    [parameter setObject:userID forKey:@"username"];
    
    [parameter setObject:userPassWord forKey:@"pwd"];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",user_Center_Base_URL,user_Center_Login];

    [self GET:urlStr parameters:parameter success:^(id result) {
        
        if ([[result objectForKey:@"result"] boolValue] == YES) {
            NSLog(@"%@",[[result objectForKey:@"orderlistValidTime"] objectForKey:@"end_date"]);
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic addEntriesFromDictionary:[result objectForKey:@"info"]];
            
            [dic setObject:userPassWord forKey:@"userPassword"];
            
            [[CBNFileManager sharedInstance] saveBasicDataTypes:dic withKey:@"user"];
            
            [[CBNUser sharedInstance] setUserModelWithUserInfo:dic];
            
            loginSecuessed(result);
        }else
        {
            loginFailed(result);
        }
    } failed:^(NSError *error) {
        
        loginFailed(error);

    }];
}
+ (void)loginOut
{
    [[CBNFileManager sharedInstance] deleteUserDefaultsWithKey:@"user"];
    
    [[CBNUser sharedInstance] setUserModelWithUserInfo:nil];

}
@end
