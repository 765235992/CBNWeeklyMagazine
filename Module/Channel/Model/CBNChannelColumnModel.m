//
//  CBNChannelColumnModel.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNChannelColumnModel.h"

@implementation CBNChannelColumnModel
- (id)initWithChannelColumnInfo:(NSDictionary *)channelColumnInfo
{
    self = [super init];
    
    if (self) {
        self.c_id = [NSString stringWithFormat:@"%@",[channelColumnInfo objectForKey:@""]];

        self.color = [NSString stringWithFormat:@"%@",[channelColumnInfo objectForKey:@"color"]];

        self.datatype = [NSString stringWithFormat:@"%@",[channelColumnInfo objectForKey:@"datatype"]];

        self.name = [NSString stringWithFormat:@"%@",[channelColumnInfo objectForKey:@"name"]];

        self.obj_id = [NSString stringWithFormat:@"%@",[channelColumnInfo objectForKey:@"obj_id"]];

        self.updatetime = [NSString stringWithFormat:@"%@",[channelColumnInfo objectForKey:@"updatetime"]];


    }
    
    return self;
}

@end
