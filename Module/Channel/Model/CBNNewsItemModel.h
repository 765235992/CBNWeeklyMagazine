//
//  CBNNewsItemModel.h
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/7/2.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBNChannelColumnModel.h"

@interface CBNNewsItemModel : NSObject
@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *Comments;
@property (nonatomic, strong) NSString *DataType;
@property (nonatomic, strong) NSString *Like;
@property (nonatomic, strong) NSString *ReleaseTime;
@property (nonatomic, strong) NSString *Time;
@property (nonatomic, strong) NSString *category_level2_id;
@property (nonatomic, strong) NSString *chapt_id;
@property (nonatomic, strong) NSString *chapt_time;
@property (nonatomic, strong) NSString *chapt_title;
@property (nonatomic, strong) NSString *click_count;
@property (nonatomic, strong) NSString *cover_img_big;
@property (nonatomic, strong) NSString *daymore;
@property (nonatomic, strong) NSString *index_title;
@property (nonatomic, strong) NSString *issue_id;
@property (nonatomic, strong) NSString *renewtime;
@property (nonatomic, strong) NSMutableArray *columnInfo;
@property (nonatomic, assign) CGFloat height;
- (id)initWithNewsItemInfo:(NSDictionary *)info andType:(NSInteger)type;
@end
