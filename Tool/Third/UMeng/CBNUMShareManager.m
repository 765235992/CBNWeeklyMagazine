//
//  CBNUMShareManager.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/4.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNUMShareManager.h"
#define isValidUrl(url) [[NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$"] evaluateWithObject:url]

@implementation CBNUMShareManager
+ (CBNUMShareManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    
    static CBNUMShareManager *_sharedInstance;
    
    dispatch_once(&onceToken, ^{
        
        _sharedInstance = [[CBNUMShareManager alloc] init];
        
    });
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}
/*
 参数描述
 sharePlate 分享平台不能为空
 title 分享标题不能为空
 content 分享描述可以为空
 sharePlate 分享image可以为空
 sharePlate 分享url可以为空
 */
- (void)shareToThePlate:(CBNThirdPlate)sharePlate title:(NSString *)title content:(NSString *)content image:(id)image andUrl:(id)url
{
    
    switch (sharePlate) {
            
        case CBNQQPlate:
            
            [self QQPlateWithtitle:title content:content image:image andUrl:url];
            
            break;
            
        case CBNQzoneoPlate:
            
            [self qzoneoPlateWithtitle:title content:content image:image andUrl:url];
            
            break;
            
        case CBNWechatSessionPlate:
            
            [self wechatSessionPlateWithtitle:title content:content image:image andUrl:url];
            
            break;
            
        case CBNWechatTimelinePlate:
            
            [self wechatTimelinePlateWithtitle:title content:content image:image andUrl:url];
            
            break;
            
        case CBNSinaPlate:
            
            [self sinaPlateWithtitle:title content:content image:image andUrl:url];
            
            break;
            
        case CBNAlipaPlate:
            
            break;
            
        default:
            
            break;
            
    }
    
}

- (void)QQPlateWithtitle:(NSString *)title content:(NSString *)content image:(id)image andUrl:(id)url
{
    //QQ空间分享标题
    [UMSocialData defaultData].extConfig.qqData.title = title;
    
    //分享网址是否有效
    if (isValidUrl(url) == YES) {
        
        [UMSocialData defaultData].extConfig.qqData.url = url;
        
    }
    
    [[UMSocialControllerService defaultControllerService] setShareText:content shareImage:[self boolImageClassWith:image] socialUIDelegate:self];
    
    [self shareToPlatformWithName:UMShareToQQ];
    
}

- (void)qzoneoPlateWithtitle:(NSString *)title content:(NSString *)content image:(id)image andUrl:(id)url
{
    //QQ空间分享标题
    [UMSocialData defaultData].extConfig.qzoneData.title = title;
    
    //分享网址是否有效
    if (isValidUrl(url) == YES) {
        
        [UMSocialData defaultData].extConfig.qzoneData.url = url;
        
    }
    
    [[UMSocialControllerService defaultControllerService] setShareText:content shareImage:[self boolImageClassWith:image] socialUIDelegate:self];
    
    [self shareToPlatformWithName:UMShareToQzone];
    
}

- (void)wechatSessionPlateWithtitle:(NSString *)title content:(NSString *)content image:(id)image andUrl:(id)url
{
    //QQ空间分享标题
    [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
    
    //分享网址是否有效
    if (isValidUrl(url) == YES) {
        
        [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
        
    }
    
    [[UMSocialControllerService defaultControllerService] setShareText:content shareImage:[self boolImageClassWith:image] socialUIDelegate:self];
    
    [self shareToPlatformWithName:UMShareToWechatSession];
    
}

- (void)wechatTimelinePlateWithtitle:(NSString *)title content:(NSString *)content image:(id)image andUrl:(id)url
{
    
    //QQ空间分享标题
    [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
    
    //分享网址是否有效
    if (isValidUrl(url) == YES) {
        
        [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
        
    }
    
    [[UMSocialControllerService defaultControllerService] setShareText:content shareImage:[self boolImageClassWith:image] socialUIDelegate:self];
    
    [self shareToPlatformWithName:UMShareToWechatTimeline];
    
}

- (void)sinaPlateWithtitle:(NSString *)title content:(NSString *)content image:(id)image andUrl:(id)url
{
    
    
    
    //分享网址是否有效
    if (isValidUrl(url) == YES) {
        
        [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
        
    }
    [UMSocialData defaultData].extConfig.qqData.title = title;
    
    UMSocialUrlResource *urlRe = [[UMSocialUrlResource alloc]init];
    
    [urlRe setResourceType:UMSocialUrlResourceTypeVideo url:url];
    
    [[UMSocialControllerService defaultControllerService] setShareText:[NSString stringWithFormat:@"%@ %@ (分享自 @第一财经周刊 )",title,url]  shareImage:[NSData dataWithContentsOfURL:[NSURL URLWithString:image]] socialUIDelegate:self];
    //设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler([self appRootViewController],[UMSocialControllerService defaultControllerService],YES);
    
}


- (id)boolImageClassWith:(id)image
{
    //如果照片是数据类型的
    if ([image isKindOfClass:[NSData class]] || [image isKindOfClass:[UIImage class]]) {
        
        return image;
        
    }
    
    if ([image isKindOfClass:[NSString class]]) {
        
        
        return [UIImage imageNamed:image];
        
        
    }
    return [UIImage imageNamed:@"defaultImage.png"];
    
}

- (void)shareToPlatformWithName:(NSString *)palteName
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:palteName];
    
    snsPlatform.snsClickHandler([self appRootViewController],[UMSocialControllerService defaultControllerService],YES);
}
/*
 * @program 第三方登录，成功或者失败通过block块进行返回
 */
- (void)thirdLoginPlate:(CBNThirdPlate)plateName secuessed:(UMLoginSecuessed)secuessed failed:(UMLoginFailed)failed
{
    
    self.secuessed = secuessed;
    
    self.failed = failed;
    
    NSString *platformName;
    
    
    switch (plateName) {
            
        case CBNQQPlate:
            /*
             QQ登录
             */
            platformName = [UMSocialSnsPlatformManager getSnsPlatformString:UMSocialSnsTypeMobileQQ];
            
            break;
            
            
        case CBNWechatSessionPlate:
            
            /*
             微信登录
             */
            platformName = [UMSocialSnsPlatformManager getSnsPlatformString:UMSocialSnsTypeWechatSession];
            
            break;
            
            
        case CBNSinaPlate:
            
            /*
             新浪登录
             */
            platformName = [UMSocialSnsPlatformManager getSnsPlatformString:UMSocialSnsTypeSina];
            
            break;
            
        case CBNAlipaPlate:
            
            break;
            
        default:
            
            break;
            
    }
    
    [UMSocialControllerService defaultControllerService].socialUIDelegate = self;
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:platformName];
    
    snsPlatform.loginClickHandler([self appRootViewController],[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        //
        //获取用户详细信息并存入本地
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            if (self.secuessed != nil) {
                
                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:platformName];
                
                secuessed(snsAccount);
            }
            
        }else{
            
            if (self.failed != nil) {
                
                failed(response.error);
                
            }
        }
        
    });
    
}
/*
 从第三方平台取消授权
 */
- (void)cancleThirdAuth:(CBNThirdPlate)plateName
{
    
    NSString *platformName;
    
    
    switch (plateName) {
            
        case CBNQQPlate:
            /*
             QQ登录
             */
            platformName = [UMSocialSnsPlatformManager getSnsPlatformString:UMSocialSnsTypeMobileQQ];
            
            break;
            
            
        case CBNWechatSessionPlate:
            
            /*
             微信登录
             */
            platformName = [UMSocialSnsPlatformManager getSnsPlatformString:UMSocialSnsTypeWechatSession];
            
            break;
            
            
        case CBNSinaPlate:
            
            /*
             新浪登录
             */
            platformName = [UMSocialSnsPlatformManager getSnsPlatformString:UMSocialSnsTypeSina];
            
            break;
            
        case CBNAlipaPlate:
            
            break;
            
        default:
            
            break;
            
    }
    [[UMSocialDataService defaultDataService] requestUnOauthWithType:platformName  completion:^(UMSocialResponseEntity *response){
        NSLog(@"%@",response);
    }];
    
}

- (UIViewController *)appRootViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *topVC = appRootVC;
    
    while (topVC.presentedViewController) {
        
        topVC = topVC.presentedViewController;
        
    }
    
    return topVC;
}

@end
