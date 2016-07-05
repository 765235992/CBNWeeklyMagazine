//
//  AppDelegate.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "UMSocial.h"
#import "CBNChannelRootVC.h"
#import "CBNUserCenterDrawVC.h"
#import "LSNavigationController.h"
#import "CBNDrawerVisualStateManager.h"
#import "UMengConfigurationManager.h"

@interface AppDelegate ()
@property (nonatomic,strong) MMDrawerController * drawerController;

@end

@implementation AppDelegate


-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    
    /*
     *  添加频道根视图
     */
    CBNChannelRootVC *mainVC =[[CBNChannelRootVC alloc]initWithNibName:nil bundle:nil];
    LSNavigationController *channelRootNavigationVC = [[LSNavigationController alloc]initWithRootViewController:mainVC];
    [channelRootNavigationVC setRestorationIdentifier:@"HLChannelRootVC"];
    
    /*
     *  添加用户根视图
     */
    CBNUserCenterDrawVC *userCenterVC =[[CBNUserCenterDrawVC alloc] initWithNibName:nil bundle:nil];
    UINavigationController *userCenterNavigationVC = [[UINavigationController alloc]initWithRootViewController:userCenterVC];
    userCenterVC.navigationController.navigationBarHidden = YES;
    
    [userCenterNavigationVC setRestorationIdentifier:@"CBNUerChannelVC"];
    
    /*
     *  添加到抽屉上去
     */
    self.drawerController = [[MMDrawerController alloc]initWithCenterViewController:channelRootNavigationVC leftDrawerViewController:userCenterNavigationVC];
    [self.drawerController setShowsShadow:YES];
    
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    
    //抽屉打开的大小
    [self.drawerController setMaximumLeftDrawerWidth:user_Draw_open_With];
    
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[CBNDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    [self.window setRootViewController:self.drawerController];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [UMengConfigurationManager configurationUMWithOptions:launchOptions];

    //    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    //    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //    [[SDImageCache sharedImageCache] setShouldDecompressImages:NO];
    //    [[SDWebImageDownloader sharedDownloader] setShouldDecompressImages:NO];
    
    // Override point for customization after application launch.
    return YES;
}

/**
 这里处理新浪微博SSO授权之后跳转回来，和微信分享完成之后跳转回来
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url wxApiDelegate:nil];
}

/**
 这里处理新浪微博SSO授权进入新浪微博客户端后进入后台，再返回原来应用
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [UMSocialSnsService  applicationDidBecomeActive];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
