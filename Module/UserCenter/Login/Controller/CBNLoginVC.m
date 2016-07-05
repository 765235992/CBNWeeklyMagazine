//
//  CBNLoginVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/4.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNLoginVC.h"
#import "CBNLoginNetworkRequest.h"
#import "CBNUMShareManager.h"
#import "CBNLoginNetworkRequest.h"
#import "CBNpPermissionsManager.h"

@interface CBNLoginVC ()
@end

@implementation CBNLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",[CBNUser sharedInstance].userPassword);
    [CBNLoginNetworkRequest loginOut];
    NSLog(@"%@",[CBNUser sharedInstance].userPassword);
    [CBNpPermissionsManager isHaveReadPermissionsWithIssueID:321];
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    loginButton.backgroundColor = [UIColor redColor];
    
    loginButton.frame = CGRectMake(0, 0, 100, 100);
    
    [loginButton addTarget:self action:@selector(loginButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginButton];
    
    
}
- (void)loginButton:(UIButton *)sender
{
    NSLog(@"登录");

    
//    [[CBNUMShareManager sharedInstance] thirdLoginPlate:CBNWechatSessionPlate secuessed:^(id result) {
//        
//        NSLog(@"[  --  %@  ---]",result);
//        
//    } failed:^(NSError *failed) {
//        
//        NSLog(@"%@",failed);
//    }];
    [CBNLoginNetworkRequest loginEventWithUserID:@"huzhixin@yicai.com" userPassWord:[NSString getTheMD5EncryptedStringWithString:@"cbnweek"] success:^(id result) {
        
        NSLog(@"%@",[CBNUser sharedInstance].avatar);
        
//        NSLog(@"%@",user.avatar);
        
    } failed:^(NSError *error) {

        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
