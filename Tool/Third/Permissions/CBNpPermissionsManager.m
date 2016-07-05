//
//  CBNpPermissionsManager.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/4.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNpPermissionsManager.h"

@implementation CBNpPermissionsManager
/*
 *  是否有阅读权限
 */
+ (BOOL)isHaveReadPermissionsWithIssueID:(NSInteger)issueID
{
    
    if ([self isSpecifyTheJournal:issueID] == YES) {
        /*
         *  只要不属于前五期内容统统可以阅读
         */
        return YES;
    }
    
    /*
     *  判断用户是否已经登录
     */
    if ([CBNUser sharedInstance].isLogin) {
        /*
         *  用户登录了 并且用户登录后有购买，并且购买的结束日期大于系统当前日期
         */
        NSDate *orderDate = [NSDate yearDayMonthChangeToStandardDateWithString:[NSString stringWithFormat:@"%@ 23:59:59",[CBNUser sharedInstance].endPermissions ]];
        
        if ([orderDate isEqualToDate:[[NSDate date] laterDate:orderDate]]) {
            NSLog(@"购买结束日期大于系统日期");
            
            return YES;
        }
        
    }
    /*
     * 最后一个需要判断钥匙串中是否拥有全新
     */
//    if (<#condition#>) {
//        <#statements#>
//    }
    
    
    return NO;
}
/*
 *  是否为指定期刊，这里指的是前5期内容
 */
+ (BOOL)isSpecifyTheJournal:(NSInteger)issueID
{
    if (issueID < 600) {
        return YES;
    }
    return NO;
}
@end
