//
//  CBNChannelColumnModel.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBNChannelColumnModel : NSObject
@property (nonatomic, strong) NSString *c_id;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *datatype;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *obj_id;
@property (nonatomic, strong) NSString *updatetime;
- (id)initWithChannelColumnInfo:(NSDictionary *)channelColumnInfo;
@end
