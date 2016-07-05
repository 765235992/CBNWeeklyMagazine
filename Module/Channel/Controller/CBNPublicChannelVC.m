//
//  CBNPublicChannelVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNPublicChannelVC.h"

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
    
    NSLog(@"揍你 %@",self.title);
}
@end
