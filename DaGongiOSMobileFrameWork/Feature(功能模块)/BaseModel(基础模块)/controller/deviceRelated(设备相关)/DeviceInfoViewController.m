//
//  DeviceInfoViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/5/31.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "DeviceInfoViewController.h"
#import "GwbButton.h"
#import "CommonConfig.h"

@implementation DeviceInfoViewController

-(void) viewDidLoad{
    [self setUpUI];
}

-(void) setUpUI{
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH/2-50,100, 100, 100) title:@"查看设备信息" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        NSString *strName       = [[UIDevice currentDevice] name];
        NSString *strSysVersion = [[UIDevice currentDevice] systemVersion];
        NSString *strModel      = [[UIDevice currentDevice] model];
        NSString *phoneModel    = [[UIDevice currentDevice] model];
        NSDictionary *dicInfo   = [[NSBundle mainBundle] infoDictionary];
        NSString *strAppName    = [dicInfo objectForKey:@"CFBundleDisplayName"];
        NSString *strAppVersion = [dicInfo objectForKey:@"CFBundleShortVersionString"];
        NSString *deviceInfo    = [NSString stringWithFormat:@"设备名称：%@ \n系统版本号：%@\n设备模式：%@\n手机型号: %@\nApp应用名称：%@\nApp应用版本：%@\n",strName,strSysVersion,strModel,phoneModel,strAppName,strAppVersion];
        UIAlertView *alert      = [[UIAlertView alloc] initWithTitle:@"提示" message:deviceInfo delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
    [self.view addSubview:btn];
}
@end
