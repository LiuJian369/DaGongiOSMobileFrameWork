//
//  AppDelegate.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/5/24.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "AppDelegate.h"
#import "CYLTabBarControllerConfig.h"
#import "CommonConfig.h"
#import "RealReachability.h"
//#import <Hyphenate/EMSDK.h>
//#import "EaseUI.h"

//#import "JSPatchHelper.h"
//#import "SYSafeCategory.h"


@interface AppDelegate ()
@end

@implementation AppDelegate

@synthesize appDefault;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //AppKey:注册的AppKey，详细见下面注释。
    //apnsCertName:推送证书名（不需要加后缀），详细见下面注释。
//    EMOptions *options = [EMOptions optionsWithAppkey:@"lj0912306#iosframework"];
//    options.apnsCertName = @"";
//    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
//    [[EaseSDKHelper shareHelper] easemobApplication:application
//                      didFinishLaunchingWithOptions:launchOptions
//                                             appkey:@"douser#istore"
//                                       apnsCertName:@"istore_dev"
//                                        otherConfig:@{kSDKConfigEnableConsoleLogger:[NSNumber numberWithBool:YES]}];
    
    [GLobalRealReachability startNotifier];
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
    [self.window setRootViewController:tabBarControllerConfig.tabBarController];
    [self.window makeKeyAndVisible];
    // 热更新加载
//    [JSPatchHelper HSDevaluateScript];
    //统一处理一些为数组、集合等对nil插入会引起闪退
//    [SYSafeCategory callSafeCategory];
    return YES;
}


- (void)applicationDidBecomeActive:(UIApplication *)application{
    //热更新JS文件下载 最好做一个时间限制 比如隔多久进行下载(间隔一小时)
//    [JSPatchHelper loadJSPatch];
}

// APP进入后台
//- (void)applicationDidEnterBackground:(UIApplication *)application
//{
//    [[EMClient sharedClient] applicationDidEnterBackground:application];
//}
//
//// APP将要从后台返回
//- (void)applicationWillEnterForeground:(UIApplication *)application
//{
//    [[EMClient sharedClient] applicationWillEnterForeground:application];
//}

@end
