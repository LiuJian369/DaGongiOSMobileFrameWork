//
//  CheckNetworkViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "CheckNetworkViewController.h"
#import "GwbButton.h"
#import "CommonConfig.h"
#import "Reachability.h"

@implementation CheckNetworkViewController

-(void) viewDidLoad{

    [self setUpUI];
}

-(void) setUpUI{
    
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH/2-50, 100, 100, 100) title:@"查看网络连接" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        
        BOOL isExistenceNetwork;
        Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
        switch ([r currentReachabilityStatus]) {
            case NotReachable:{
                isExistenceNetwork=FALSE;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"no connect" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
                break;
            case ReachableViaWWAN:{
                isExistenceNetwork=TRUE;
                UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"3g or 4g" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
                break;
            case ReachableViaWiFi:{
                UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"wifi" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                isExistenceNetwork=TRUE;
            }
                break;
        }
        
    }];
    [self.view addSubview:btn];

}
@end
