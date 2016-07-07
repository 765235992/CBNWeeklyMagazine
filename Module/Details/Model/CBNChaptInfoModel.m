//
//  CBNChaptInfoModel.m
//  CBNMagazine
//
//  Created by huaxianwei on 16/6/19.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNChaptInfoModel.h"

@implementation CBNChaptInfoModel
/*
 *  初始化
 */
- (id)initWithChaptInfoResult:(NSDictionary *)chaptInfoResult
{
    self = [super init];
    
    if (self) {
        
        NSLog(@"%@",chaptInfoResult);
        /*
         *  期刊ID
         */
        self.issueID = [[chaptInfoResult objectForKey:@"issue_id"] integerValue];
        
        /*
         *  文章ID
         */
        self.chaptID = [[chaptInfoResult objectForKey:@"chapt_id"] integerValue];
        
        /*
         *  文章标题
         */
        self.chaptTitle = [chaptInfoResult objectForKey:@"chapt_title"];
        
        /*
         *  文章摘要
         */
        self.chaptBrief = [chaptInfoResult objectForKey:@"chapt_brief"];
        
        /*
         *  文章标签名字
         */
        self.categoryName = [chaptInfoResult objectForKey:@"category_name"];
        
        /*
         *  文章是否有图片
         */
        self.isHavePic = [[chaptInfoResult objectForKey:@"if_pic"] boolValue];
        
        /*
         *  文章图片地址
         */
        self.chaptPicURL = [chaptInfoResult objectForKey:@"cover_img_big"];
        
        self.chaptTime = [chaptInfoResult objectForKey:@"chapt_time"];
        /*
         *  文章评论数
         */
        self.Comments = [NSString stringWithFormat:@"%@",[chaptInfoResult objectForKey:@"Comments"]];
        
        /*
         *  文章类型
         */
        self.DataType = [NSString stringWithFormat:@"%@",[chaptInfoResult objectForKey:@"DataType"]];

        /*
         *
         */
        self.ExteriorChain = [NSString stringWithFormat:@"%@",[chaptInfoResult objectForKey:@"ExteriorChain"]];

        /*
         *  文章点赞数
         */
        self.Like = [NSString stringWithFormat:@"%@",[chaptInfoResult objectForKey:@"Like"]];

        /*
         *  二级标签
         */
        self.ParentCategory = [NSString stringWithFormat:@"%@",[chaptInfoResult objectForKey:@"ParentCategory"]];

        /*
         *  文章发布时间
         */
        self.ReleaseTime = [NSString stringWithFormat:@"%@",[chaptInfoResult objectForKey:@"ReleaseTime"]];

        /*
         *  文章视频时间
         */
        self.Time = [NSString stringWithFormat:@"%@",[chaptInfoResult objectForKey:@"Time"]];

        /*
         *  文章是否为日更
         */
        self.daymore = [NSString stringWithFormat:@"%@",[chaptInfoResult objectForKey:@"daymore"]];

        /*
         *  文章发布时间
         */
        self.columnInfo = [[NSMutableArray alloc] init];
        
        for (NSDictionary *tempcolumnInfo in [chaptInfoResult objectForKey:@"columnInfo"]) {
            CBNChannelColumnModel *channelColimnmModel = [[CBNChannelColumnModel alloc] initWithChannelColumnInfo:tempcolumnInfo];
            
            [_columnInfo addObject:channelColimnmModel];
        }
    }
    
    return self;
}
- (void)dealloc
{
    NSLog(@"释放 -- %@",self);
}
@end
