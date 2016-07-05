//
//  CBNNewsItemModel.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/7/2.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNNewsItemModel.h"
#import "CBNChannelColumnModel.h"

@implementation CBNNewsItemModel
- (id)initWithNewsItemInfo:(NSDictionary *)info andType:(NSInteger)type
{
    self = [super init];
    
    if (self) {
        self.Comments = [NSString stringWithFormat:@"%@",[info objectForKey:@"Comments"]];
        self.DataType = [NSString stringWithFormat:@"%@",[info objectForKey:@"DataType"]];
        self.type = [NSString stringWithFormat:@"%ld",(long)type];

        self.Like = [NSString stringWithFormat:@"%@",[info objectForKey:@"Like"]];

        self.ReleaseTime = [NSString stringWithFormat:@"%@",[info objectForKey:@"ReleaseTime"]];

        self.Time = [NSString stringWithFormat:@"%@",[info objectForKey:@"Time"]];

        self.category_level2_id = [NSString stringWithFormat:@"%@",[info objectForKey:@"category_level2_id"]];

        self.chapt_id = [NSString stringWithFormat:@"%@",[info objectForKey:@"chapt_id"]];

        self.chapt_time = [NSString stringWithFormat:@"%@",[info objectForKey:@"chapt_time"]];

        self.chapt_title = [NSString stringWithFormat:@"%@",[info objectForKey:@"chapt_title"]];

        self.click_count = [NSString stringWithFormat:@"%@",[info objectForKey:@"click_count"]];

        self.cover_img_big = [NSString stringWithFormat:@"%@",[info objectForKey:@"cover_img_big"]];

        self.daymore = [NSString stringWithFormat:@"%@",[info objectForKey:@"daymore"]];

        self.index_title = [NSString stringWithFormat:@"%@",[info objectForKey:@"index_title"]];

        self.issue_id = [NSString stringWithFormat:@"%@",[info objectForKey:@"issue_id"]];

        self.renewtime = [NSString stringWithFormat:@"%@",[info objectForKey:@"renewtime"]];

        
        self.columnInfo = [[NSMutableArray alloc] init];
        
        for (NSDictionary *columnInfoDic in [info objectForKey:@"columnInfo"]) {
            
            CBNChannelColumnModel *columnModel = [[CBNChannelColumnModel alloc] initWithChannelColumnInfo:columnInfoDic];
            
            [_columnInfo addObject:columnModel];
        }
        

    }
    
    return self;
}
@end
