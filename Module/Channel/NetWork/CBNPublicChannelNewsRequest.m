//
//  CBNPublicChannelNewsRequest.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/6.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNPublicChannelNewsRequest.h"

@implementation CBNPublicChannelNewsRequest
- (NSString *)getProjectNewsURL
{
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@",sever_URL,@"Column",GetList];
    NSLog(@"%@",urlString);
    return urlString;
    
}
/*
 *  获取频道请求参数
 */
- (NSDictionary *)getProjectNewsParametersWithChannelModel:(CBNChannelColumnModel *)channelModel andPage:(NSString *)page pageCount:(NSString *)pageCount
{
    NSString *secretStr = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@",secret_key,GetList]];
    
//    NSLog(@"")
    NSString *secretStr2 = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@%@%@",channelModel.c_id,channelModel.obj_id,page,secret_key]];
    NSString *str = [NSString stringWithFormat:@"Cid=%@&ObjId=%@&DateType=%@&page=%@&PageCount=%@&key=%@&setKey=%@",channelModel.c_id,channelModel.obj_id,channelModel.datatype,page,pageCount,secretStr,secretStr2];
    NSLog(@"%@",str);
    NSMutableDictionary *parDic = [[NSMutableDictionary alloc] init];
    [parDic setObject:str forKey:@"str"];
//
//    [parDic setObject:channelModel.c_id forKey:@"Cid"];
//    [parDic setObject:channelModel.obj_id forKey:@"ObjId"];
//    [parDic setObject:channelModel.datatype forKey:@"DateType"];
//    [parDic setObject:page forKey:@"page"];
//    [parDic setObject:pageCount forKey:@"PageCount"];
//    [parDic setObject:secretStr forKey:@"key"];
//    [parDic setObject:secretStr2 forKey:@"setKey"];
    return parDic;
    
}

- (void)loadPublicChannelNewsWithParameterDic:(NSDictionary *)parameterDic loadDataSecuessed:(loadDataSecuessed)loadDataSecuessed loadDataFailed:(loadDataFailed)loadDataFailed
{

    [self.connection cancel];
    
    NSURL *url = [NSURL URLWithString:[self getProjectNewsURL]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [request setHTTPMethod:@"POST"];
    
    NSData *data = [[parameterDic objectForKey:@"str"] dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    
    self.connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
}
//接收到服务器回应的时候调用此方法

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response

{
    
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    
    NSLog(@"%@",[res allHeaderFields]);
    
    self.receiveData = [NSMutableData data];
    
    
    
    
    
}

//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
    
    [self.receiveData appendData:data];
    
}

//数据传完之后调用此方法

-(void)connectionDidFinishLoading:(NSURLConnection *)connection

{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self.receiveData options:0 error:nil];
    
    
    NSLog(@"%@ ",dic);
    
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法

-(void)connection:(NSURLConnection *)connection

 didFailWithError:(NSError *)error

{
    
    NSLog(@"%@",[error localizedDescription]);
}

- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    
}
@end
