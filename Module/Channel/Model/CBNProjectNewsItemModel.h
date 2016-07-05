//
//  CBNProjectNewsItemModel.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBNProjectNewsItemModel : NSObject
@property (nonatomic, strong) NSString *DataType;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *subject_id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
- (id)initWithProjectNewsItemDic:(NSDictionary *)result;
@end
