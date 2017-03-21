//
//  PassValueViewController3.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "PassValueViewController3.h"
#import "GwbButton.h"
#import "PassValueViewController.h"

@implementation PassValueViewController3

-(void) viewDidLoad{
    
    [self setUpButton];
    
}


-(void) setUpButton{
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(50, 500, 300, 50) title:@"跳跃POP传值" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        PassValueViewController* oneVC =nil;
            for (UIViewController* vc in self.navigationController.viewControllers) {
                if ([vc isKindOfClass:[PassValueViewController class]]) {
                    oneVC=(PassValueViewController *)vc;
                    oneVC.passValue1=@"跳跃POP回传值";
                    [self.navigationController popToViewController:oneVC animated:YES];
                }
            }
    }];
    btn.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn];
}

@end
