//
//  NotiPassValueViewController.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "NotiPassValueViewController.h"
#import "GwbButton.h"
#import "CommonConfig.h"
#import "NotiPassValueViewController2.h"

@interface NotiPassValueViewController ()
@property (strong,nonatomic)  UITextField *notiPassValueTextField;
@end


@implementation NotiPassValueViewController

-(void) viewDidLoad{
    
    [self setUpUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeNameNotification:) name:@"ChangeNameNotification" object:nil];
}


-(void) setUpUI{
    [self setUpButton];
    self.notiPassValueTextField= [[UITextField alloc] initWithFrame:CGRectMake(0,100,SCREEN_WIDTH, 50)];
    [self.notiPassValueTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:self.notiPassValueTextField];
    self.notiPassValueTextField.text=@"将要显示通过Notificaiton回传的值";
}

-(void)ChangeNameNotification:(NSNotification*)notification{
    NSDictionary *nameDictionary = [notification userInfo];
    self.notiPassValueTextField.text = [nameDictionary objectForKey:@"name"];
}

-(void) setUpButton{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(0, 200, SCREEN_WIDTH, 50) title:@"notification反向传值" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        [self.navigationController pushViewController:[[NotiPassValueViewController2 alloc] init] animated:YES];
    }];
    btn.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn];
    
   
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end

