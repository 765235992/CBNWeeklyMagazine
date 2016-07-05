//
//  CBNpPermissionsManager.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/4.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBNpPermissionsManager : NSObject
/*
 *  是否有阅读权限
 */
+ (BOOL)isHaveReadPermissionsWithIssueID:(NSInteger)issueID;
@end
