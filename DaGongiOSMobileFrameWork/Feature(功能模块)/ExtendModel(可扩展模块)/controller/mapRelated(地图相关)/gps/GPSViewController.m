//
//  GPSViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "GPSViewController.h"
#import "GwbButton.h"
#import "CommonConfig.h"
#import "MapShowViewController.h"
#import "ShowLocationViewController.h"

@implementation GPSViewController

-(void) viewDidLoad{

    [self setUpUI];
}

-(void) setUpUI{
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH/2-50, 100, 100, 100) title:@"显示地图" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        
        [self.navigationController pushViewController:[[MapShowViewController alloc] init] animated:YES];
        
    }];
    [self.view addSubview:btn];
    
    GwbButton *btn2=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH/2-50, 300, 100, 100) title:@"显示位置" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        
        [self.navigationController pushViewController:[[ShowLocationViewController alloc] init] animated:YES];
        
    }];
    [self.view addSubview:btn2];

}
@end
