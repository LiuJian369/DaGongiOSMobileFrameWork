//
//  DelegatePassValueViewController1.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "DelegatePassValueViewController1.h"
#import "GwbButton.h"
#import "CommonConfig.h"
#import "DelegatePassValueViewController2.h"

@interface DelegatePassValueViewController1 ()

@property (strong,nonatomic)  UITextField *delegatePassValueTextField;

@end

@implementation DelegatePassValueViewController1

-(void) viewDidLoad{
    
    [self setUpUI];
}


-(void) setUpUI{
    [self setUpButton];
    self.delegatePassValueTextField= [[UITextField alloc] initWithFrame:CGRectMake(0,100,SCREEN_WIDTH, 50)];
    [self.delegatePassValueTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:self.delegatePassValueTextField];
}


-(void) setUpButton{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(0, 200, SCREEN_WIDTH, 50) title:@"delgate传值" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        DelegatePassValueViewController2 *delgateController2 = [[DelegatePassValueViewController2 alloc]init];
        self.delegate =(id)delgateController2;
        [self.delegate toDelegateController2:self.delegatePassValueTextField.text];
        [self.navigationController pushViewController:delgateController2 animated:YES];
    }];
    btn.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn];
    
    GwbButton *btn2=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(0, 300, SCREEN_WIDTH, 50) title:@"delegate逆向传值" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        DelegatePassValueViewController3 *dl3=[[DelegatePassValueViewController3 alloc] init];
        dl3.delegate = self;
        [self.navigationController pushViewController:dl3 animated:YES];
    }];
    btn2.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn2];
}


-(void)showName:(NSString *)nameString{
    self.delegatePassValueTextField.text = nameString;
}


@end
