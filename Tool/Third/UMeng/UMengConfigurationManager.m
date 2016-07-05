//
//  UMengConfigurationManager.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/4.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "UMengConfigurationManager.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "UMSocialAlipayShareHandler.h"
#define UmengAppkey @"54d2e806fd98c5e87f0002ed"
@implementation UMengConfigurationManager
/*
 第一步：对UM进行相关配置
 */
+ (void)configurationUMWithOptions:(NSDictionary *)launchOptions
{
    //设置友盟社会化组件appkey
    [UMSocialData setAppKey:UmengAppkey];
    
    //打开调试log的开关
    [UMSocialData openLog:YES];
    
    //如果你要支持不同的屏幕方向，需要这样设置，否则在iPhone只支持一个竖屏方向
    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskAll];
    
    //设置微信AppId，设置分享url，默认使用友盟的网址
    [UMSocialWechatHandler setWXAppId:@"wx629772ef8be9580c" appSecret:@"6d17e4b411ad7bab4bc61855c49da7c7" url:@"http://www.umeng.com/social"];
    
    // 打开新浪微博的SSO开关
    // 将在新浪微博注册的应用appkey、redirectURL替换下面参数，并在info.plist的URL Scheme中相应添加wb+appkey，如"wb3921700954"，详情请参考官方文档。
    
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3921700954"
                                              secret:@"04b48b094faeb16683c32669824ebdad"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    // 设置支付宝分享的appId
    [UMSocialAlipayShareHandler setAlipayShareAppId:@"2015111700822536"];
    
    
    //    //设置分享到QQ空间的应用Id，和分享url 链接
    [UMSocialQQHandler setQQWithAppId:@"1104950857" appKey:@"csIU56gpWsqBJgnQ" url:@"http://www.umeng.com/social"];
    
    //    //设置支持没有客户端情况下使用SSO授权
    [UMSocialQQHandler setSupportWebView:YES];
    
}
@end
