//
//  CBNInfomationVC.h
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/28.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBaseViewController.h"

@interface CBNInfomationVC : CBNBaseViewController
/*
 *  仅限新闻详情使用
 */
- (void)setBarButtonItems;

- (void)setClearItemTitle;

- (void)setBackBarButtonItem;

- (void)setItemTitleWithTitle:(NSString *)title;

- (void)serRightBarButtonWithText:(NSString *)text;
@end
