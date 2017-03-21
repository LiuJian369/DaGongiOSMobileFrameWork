//
//  LogOutViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "LogOutViewController.h"
#import "GwbButton.h"
#import "CommonConfig.h"
#import "AppDelegate.h"
#import "CYLTabBarControllerConfig.h"

@implementation LogOutViewController

-(void) viewDidLoad {

    [self setUpUI];
}

-(void) setUpUI{

    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH/2-50, 100, 100, 100) title:@"登出" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
//        myDelegate.sessionInfo = nil;
        myDelegate.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
        CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
        myDelegate.window.rootViewController =tabBarControllerConfig.tabBarController;
        myDelegate.window.backgroundColor = [UIColor whiteColor];
        [myDelegate.window makeKeyAndVisible];
        
    }];
    [self.view addSubview:btn];
}

@end
