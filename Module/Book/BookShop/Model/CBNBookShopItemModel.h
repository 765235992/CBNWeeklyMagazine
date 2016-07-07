//
//  CBNBookShopItemModel.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBNBookShopItemModel : NSObject
@property (nonatomic, strong) NSString *cover_img;
@property (nonatomic, strong) NSString *cover_img_orig;
@property (nonatomic, strong) NSString *cover_img_pad;
@property (nonatomic, strong) NSString *issue_id;
@property (nonatomic, strong) NSString *issue_time;
@property (nonatomic, strong) NSString *maga_all_number;
@property (nonatomic, strong) NSString *maga_day;
@property (nonatomic, strong) NSString *maga_month;
@property (nonatomic, strong) NSString *maga_note;
@property (nonatomic, strong) NSString *maga_time;
@property (nonatomic, strong) NSString *maga_year;
@property (nonatomic, strong) NSString *maga_year_number;
@property (nonatomic, strong) NSString *renewtime;
@property (nonatomic, assign) CGFloat height;
- (id)initWithBookShopItemInfo:(NSDictionary *)bookShopItemInfo;

@end
