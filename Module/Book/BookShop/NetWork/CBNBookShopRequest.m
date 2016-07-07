//
//  CBNBookShopRequest.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBookShopRequest.h"

@implementation CBNBookShopRequest
- (NSString *)getBookShopURL
{
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@",sever_URL,@"Weekly",@"BookstoreList"];
    NSLog(@"%@",urlString);
    return urlString;
    
}
/*
 *  获取频道请求参数
 */
- (NSDictionary *)getBookShopParametersWithYear:(NSString *)year andPage:(NSString *)page pageCount:(NSString *)pageCount
{
    NSString *secretStr = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@",secret_key,@"BookstoreList"]];
    
    NSString *isAll = @"2";
    if ([year integerValue] > 1000) {
        isAll = @"1";
    }
    NSString *secretStr2 = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@_%@%@%@",isAll,year,page,secret_key]];

    
    NSString *str = [NSString stringWithFormat:@"Year=%@&All=%@&page=%@&PageCount=%@&key=%@&setKey=%@",year,isAll,page,pageCount,secretStr,secretStr2];
    NSLog(@"%@",str);
    NSMutableDictionary *parDic = [[NSMutableDictionary alloc] init];
    
    [parDic setObject:str forKey:@"str"];

    return parDic;
    
}
- (void)loadBookShopWithParameterDic:(NSDictionary *)parameterDic loadDataSecuessed:(loadDataSecuessed)loadDataSecuessed loadDataFailed:(loadDataFailed)loadDataFailed
{
    
    self.aLoadDataFailed = loadDataFailed;
    self.aLoadDataSecuessed = loadDataSecuessed;
    
    [self.connection cancel];

    NSURL *url = [NSURL URLWithString:[self getBookShopURL]];
    NSLog(@"%@",url);
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
    
    if ([[dic objectForKey:@"Code"]  integerValue] == 200) {
        if (self.aLoadDataSecuessed!=nil) {
            self.aLoadDataSecuessed(dic);
        }
    }else{
        if (self.aLoadDataFailed!=nil) {
            self.aLoadDataFailed([dic objectForKey:@"Error"]);
        }
    }

   
    
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法

-(void)connection:(NSURLConnection *)connection

 didFailWithError:(NSError *)error

{
    if (self.aLoadDataFailed!=nil) {
        self.aLoadDataFailed(error);
    }
}

- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    
}

@end
