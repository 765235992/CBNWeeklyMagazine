//
//  CBNProjectNewsItemModel.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNProjectNewsItemModel.h"

@implementation CBNProjectNewsItemModel
- (id)initWithProjectNewsItemDic:(NSDictionary *)result
{
    self = [super init];
    
    if (self) {
        
        self.DataType = [NSString stringWithFormat:@"%@",[result objectForKey:@"DataType"]];
        
        self.img = [NSString stringWithFormat:@"%@",[result objectForKey:@"img"]];
                
        self.subject_id = [NSString stringWithFormat:@"%@",[result objectForKey:@"subject_id"]];
        
        self.title = [NSString stringWithFormat:@"%@",[result objectForKey:@"title"]];
        
        self.url = [NSString stringWithFormat:@"%@",[result objectForKey:@"url"]];

    }
    
    return self;
    
}
@end
