//
//  NotiPassValueViewController2.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "NotiPassValueViewController2.h"
#import "GwbButton.h"
#import "CommonConfig.h"

@implementation NotiPassValueViewController2

-(void)viewDidLoad{
    
    [self setUpButton];
}

-(void) setUpButton{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(0, 200, SCREEN_WIDTH, 50) title:@"noti传值" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeNameNotification" object:self userInfo:@{@"name":@"这是通过nification从第二个页面回传的值"}];
        [self.navigationController popViewControllerAnimated:YES];
        
    }];
    btn.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn];
    
    
}

@end

