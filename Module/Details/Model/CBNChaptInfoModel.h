//
//  CBNChaptInfoModel.h
//  CBNMagazine
//
//  Created by huaxianwei on 16/6/19.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBNChannelColumnModel.h"

@interface CBNChaptInfoModel : NSObject

/*
 *  期刊ID
 */
@property (nonatomic, assign) NSInteger issueID;
/*
 *  文章ID
 */
@property (nonatomic, assign) NSInteger chaptID;
/*
 *  文章标题
 */
@property (nonatomic, strong) NSString *chaptTitle;
/*
 *  文章摘要
 */
@property (nonatomic, strong) NSString *chaptBrief;
/*
 *  文章标签名字
 */
@property (nonatomic, strong) NSString *categoryName;
/*
 *  文章是否有图片
 */
@property (nonatomic, assign) BOOL isHavePic;
/*
 *  文章图片地址
 */
@property (nonatomic, strong) NSString *chaptPicURL;
/*
 *  文章图片地址
 */
@property (nonatomic, strong) NSString *chaptTime;

/*
 *  文章评论数
 */
@property (nonatomic, strong) NSString *Comments;
/*
 *  文章类型
 */
@property (nonatomic, strong) NSString *DataType;
/*
 *
 */
@property (nonatomic, strong) NSString *ExteriorChain;
/*
 *  文章点赞数
 */
@property (nonatomic, strong) NSString *Like;
/*
 *  二级标签
 */
@property (nonatomic, strong) NSString *ParentCategory;
/*
 *  文章发布时间
 */
@property (nonatomic, strong) NSString *ReleaseTime;
/*
 *  文章视频时间
 */
@property (nonatomic, strong) NSString *Time;
/*
 *  文章是否为日更
 */
@property (nonatomic, strong) NSString *daymore;
/*
 *  文章发布时间
 */
@property (nonatomic, strong) NSMutableArray *columnInfo;
/*
 *  初始化
 */
- (id)initWithChaptInfoResult:(NSDictionary *)chaptInfoResult;



@end
