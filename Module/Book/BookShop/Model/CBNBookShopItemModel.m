//
//  CBNBookShopItemModel.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBookShopItemModel.h"

@implementation CBNBookShopItemModel
- (id)initWithBookShopItemInfo:(NSDictionary *)bookShopItemInfo
{
    self = [super init];
    
    if (self) {
        self.cover_img = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"cover_img"]];
        
        self.cover_img_orig = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"cover_img_orig"]];

        self.cover_img_pad = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"cover_img_pad"]];

        self.issue_id = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"issue_id"]];

        self.issue_time = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"issue_time"]];

        self.maga_all_number = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"maga_all_number"]];

        self.maga_day = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"maga_day"]];

        self.maga_month = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"maga_month"]];

        self.maga_note = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"maga_note"]];

        self.maga_time = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"maga_time"]];

        self.maga_year = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"maga_year"]];

        self.maga_year_number = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"maga_year_number"]];

        self.renewtime = [NSString stringWithFormat:@"%@",[bookShopItemInfo objectForKey:@"renewtime"]];

    }
    
    return self;
}
@end
