//
//  CBNProjectNewsRequest.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNProjectNewsRequest.h"

@implementation CBNProjectNewsRequest
/*
 *  获取频道请求连接
 */
+ (NSString *)getProjectNewsURL
{
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@",sever_URL,Index,GetProjectList];
    
    return urlString;

}
/*
 *  获取频道请求参数
 */
+ (NSDictionary *)getProjectNewsParameters
{
    NSString *secretStr = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@",secret_key,GetProjectList]];
    
    NSMutableDictionary *parDic = [[NSMutableDictionary alloc] init];
    
    [parDic setObject:secretStr forKey:sever_key_Str];

    return parDic;
    
}
/*
 *  刷新
 */
+ (void)refreshProjectFromSeverSuccess:(void (^)(NSMutableArray *projectModelArray))projectModelArray failed:(void (^)(NSString *errorStr))errorStr
{
    
    
    [self GET:[self getProjectNewsURL] parameters:[self getProjectNewsParameters] success:^(id result) {
        
        if ([[result objectForKey:@"Code"]integerValue] == 200) {
            NSMutableArray *array = [[NSMutableArray alloc] init];
            
            for (NSDictionary *dic in [[result objectForKey:@"DataList"] objectForKey:@"data"]) {
                CBNProjectNewsItemModel *tempProjectModel = [[CBNProjectNewsItemModel alloc]initWithProjectNewsItemDic:dic];
                [array addObject:tempProjectModel];
            }
            
            projectModelArray(array);
            
        }else{
            errorStr([result objectForKey:@"Error"]);
        }
        
    } failed:^(NSError *error) {
        
        errorStr([error.userInfo objectForKey:@"Error"]);

    }];
}

/*
 *  加载更多
 */
+ (void)loadMoreProjectFromSeverSuccess:(void (^)(NSMutableArray *projectModelArray))projectModelArray failed:(void (^)(NSString *errorStr))errorStr
{
    [self GET:[self getProjectNewsURL] parameters:[self getProjectNewsParameters] success:^(id result) {
        
        if ([[result objectForKey:@"Code"]integerValue] == 200) {
            NSMutableArray *array = [[NSMutableArray alloc] init];
            
            for (NSDictionary *dic in [[result objectForKey:@"DataList"] objectForKey:@"data"]) {
                CBNProjectNewsItemModel *tempProjectModel = [[CBNProjectNewsItemModel alloc]initWithProjectNewsItemDic:dic];
                [array addObject:tempProjectModel];
            }
            
            projectModelArray(array);
            
        }else{
            errorStr([result objectForKey:@"Error"]);
        }
        
    } failed:^(NSError *error) {
        
        errorStr([error.userInfo objectForKey:@"Error"]);
        
    }];
}








@end
