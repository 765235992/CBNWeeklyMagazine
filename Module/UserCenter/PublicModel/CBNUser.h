//
//  CBNUser.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/4.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBNUser : NSObject
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, strong) NSMutableDictionary *userInfo;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *ifmod;
@property (nonatomic, strong) NSString *isBind;
@property (nonatomic, strong) NSString *isCBNUser;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *uemail;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *userPhoneNumber;
@property (nonatomic, strong) NSString *userPassword;
@property (nonatomic, strong) NSString *endPermissions;

/*
 *  使用单利，因为要全局使用
 */
+ (CBNUser *)sharedInstance;
/*
 *  设置基本信息
 */
- (void)setUserModelWithUserInfo:(NSDictionary *)userInfo;

/*
 *  修改用户相应信息
 */
- (void)changeUserPropertyWithKey:(NSString *)key andValue:(NSString *)value;
@end
