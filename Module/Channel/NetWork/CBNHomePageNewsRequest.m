//
//  CBNHomePageNewsRequest.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNHomePageNewsRequest.h"
#import "CBNNewsItemModel.h"

#define URL_Key_Word @"GetIndexArticleList"

@implementation CBNHomePageNewsRequest

/*
 *  使用单利，因为要全局使用
 */
+ (CBNHomePageNewsRequest *)sharedInstance
{
    static dispatch_once_t onceToken;
    
    static CBNHomePageNewsRequest *_sharedInstance;
    
    dispatch_once(&onceToken, ^{
        
        _sharedInstance = [[CBNHomePageNewsRequest alloc] init];
        
    });
    
    return _sharedInstance;
}
- (id)init
{
    self = [super init];
    
    if (self) {
        self.recommendCount = 0;

    }
    
    return self;
}

/*
 *  获取频道请求连接
 */
+ (NSString *)getHomePageNewsURL
{
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@",sever_URL,Index,URL_Key_Word];
    
    return urlString;
}
/*
 *  获取频道请求参数
 */
+ (NSDictionary *)getHomePageNewsParameters
{
    NSString *secretStr = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@",secret_key,URL_Key_Word]];
    
    NSMutableDictionary *parDic = [[NSMutableDictionary alloc] init];
    
    [parDic setObject:secretStr forKey:sever_key_Str];
    
    return parDic;
}

/*
 *  刷新
 */
- (void)refreshHomePageNewsFromSeverWith:(NSInteger)page success:(void (^)(NSMutableArray *homePageModelrray,NSMutableArray *sliderArray))homePageModelrray failed:(void (^)(NSString *errorStr))errorStr
{
    

    [CBNHomePageNewsRequest GET:[CBNHomePageNewsRequest getHomePageNewsURL] parameters:[CBNHomePageNewsRequest getHomePageNewsParameters] success:^(id result) {
        
        if ([[result objectForKey:@"Code"] integerValue] == 200) {
            /*
             *  缓存本地一份
             */
            [[CBNFileManager sharedInstance] saveBasicDataTypes:result withKey:URL_Key_Word];

            NSMutableArray *dataListArray = [[[result objectForKey:@"DataList"] objectForKey:@"List"] objectForKey:@"data"];
            NSMutableArray *tempHomePageArray = [[NSMutableArray alloc] init];
            _recommendCount = 0;

            for (NSDictionary *homePageNewsItem in dataListArray) {

                NSInteger dataType = [[homePageNewsItem objectForKey:@"DataType"] integerValue];
                
                if (dataType == 1) {
                    /*
                     *  视频
                     */
                    if (_recommendCount != 3) {
                        dataType = 0;
                        _recommendCount++;
                    }else{
                        dataType = 1;
                        _recommendCount = 0;
                    }
                }

                CBNNewsItemModel *tempNewsItem = [[CBNNewsItemModel alloc] initWithNewsItemInfo:homePageNewsItem andType:dataType];
                [tempHomePageArray addObject:tempNewsItem];
                
            }
            NSMutableArray *sliderArr = [[result objectForKey:@"DataList"] objectForKey:@"SwfList"];
            
            NSMutableArray *tempSliderArr = [[NSMutableArray alloc] init];
            NSInteger i = 0;
            for (NSDictionary *sliderDic in sliderArr) {
                
                CBNNewsItemModel *tempNewsItem = [[CBNNewsItemModel alloc] initWithNewsItemInfo:sliderDic andType:i];
                i++;
                [tempSliderArr addObject:tempNewsItem];
                
            }
            homePageModelrray(tempHomePageArray,tempSliderArr);
        }else
        {
            errorStr([result objectForKey:@"Error"]);
        }
        
    } failed:^(NSError *error) {
        
        errorStr([error.userInfo objectForKey:@"Error"]);

    }];

}

/*
 *  加载更多
 */
- (void)loadMoreHomePageNewsFromSeverWith:(NSInteger)page success:(void (^)(NSMutableArray *homePageModelrray))homePageModelrray failed:(void (^)(NSString *errorStr))errorStr
{
    [CBNHomePageNewsRequest GET:[CBNHomePageNewsRequest getHomePageNewsURL] parameters:[CBNHomePageNewsRequest getHomePageNewsParameters] success:^(id result) {
        
        if ([[result objectForKey:@"Code"] integerValue] == 200) {
            /*
             *  缓存本地一份
             */
            [[CBNFileManager sharedInstance] saveBasicDataTypes:result withKey:URL_Key_Word];
            
            NSMutableArray *dataListArray = [[[result objectForKey:@"DataList"] objectForKey:@"List"] objectForKey:@"data"];
            NSMutableArray *tempHomePageArray = [[NSMutableArray alloc] init];
            NSLog(@"%@",result);
            for (NSDictionary *homePageNewsItem in dataListArray) {
                
                NSInteger dataType = [[homePageNewsItem objectForKey:@"DataType"] integerValue];
                NSInteger type = 0;
                if (dataType == 1 || dataType == 3) {
                    /*
                     *  视频
                     */
                    if (_recommendCount != 3) {
                        type = 0;
                        _recommendCount++;
                    }else{
                        type = 1;
                        _recommendCount = 0;
                    }
                }
                CBNNewsItemModel *tempNewsItem = [[CBNNewsItemModel alloc] initWithNewsItemInfo:homePageNewsItem andType:type];
                
                [tempHomePageArray addObject:tempNewsItem];
                
            }
            homePageModelrray(tempHomePageArray);
        }else
        {
            errorStr([result objectForKey:@"Error"]);
        }
        
        
    } failed:^(NSError *error) {
        errorStr([error.userInfo objectForKey:@"Error"]);
        
    }];
    

}
@end
