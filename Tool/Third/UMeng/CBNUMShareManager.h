//
//  CBNUMShareManager.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/4.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "UMSocialAlipayShareHandler.h"
typedef NS_ENUM(NSInteger, CBNThirdPlate) {
    
    CBNQQPlate = 0,
    
    CBNQzoneoPlate = 1,
    
    CBNWechatSessionPlate = 2,
    
    CBNWechatTimelinePlate = 3,
    
    CBNWechatFavoritePlate = 4,
    
    CBNSinaPlate = 5,
    
    CBNAlipaPlate = 6
    
};
/*
 登录成功的回调
 */
typedef void(^UMLoginSecuessed)(id result);

/*
 登录失败的回调
 */
typedef void(^UMLoginFailed)(NSError *failed);

@interface CBNUMShareManager : NSObject<UMSocialUIDelegate>
@property (nonatomic, copy) UMLoginSecuessed secuessed;

@property (nonatomic, copy) UMLoginFailed failed;

+ (CBNUMShareManager *)sharedInstance;


/*
 参数描述
 sharePlate 分享平台不能为空
 title 分享标题不能为空，微信朋友圈分享出去的没有标题
 content 分享描述可以为空
 image 分享image可以为空 可以传入UIImage或者NSData类型
 url 分享url可以为空
 */
- (void)shareToThePlate:(CBNThirdPlate)sharePlate title:(NSString *)title content:(NSString *)content image:(id)image andUrl:(id)url;

/*
 开始进行第三方登录，
 */
- (void)thirdLoginPlate:(CBNThirdPlate)plateName secuessed:(UMLoginSecuessed)secuessed failed:(UMLoginFailed)failed;

/*
 从第三方平台取消授权
 */
- (void)cancleThirdAuth:(CBNThirdPlate)plateName;

@end
