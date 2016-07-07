//
//  CBNPublicChannelVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNPublicChannelVC.h"
#import "CBNPublicChannelNewsRequest.h"

@interface CBNPublicChannelVC ()
@property (nonatomic, strong) CBNPublicChannelNewsRequest *request;
@end

@implementation CBNPublicChannelVC
- (void)dealloc
{
    NSLog(@"大神");
}
- (id)init
{
    self = [super init];
    
    if (self) {
        NSLog(@"创建");
    }
    
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"揍你 %@",self.channelColumnModel.c_id);
    
    [self.request loadPublicChannelNewsWithParameterDic:[self.request getProjectNewsParametersWithChannelModel:self.channelColumnModel andPage:@"1" pageCount:@"10"] loadDataSecuessed:^(id result) {
        NSLog(@"%@",result);
    } loadDataFailed:^(NSError *error) {
        NSLog(@"%@",error);

    }];
}

- (CBNPublicChannelNewsRequest *)request
{
    if (!_request) {
        
        self.request = [[CBNPublicChannelNewsRequest alloc] init];
    }
    
    return _request;
}
@end
