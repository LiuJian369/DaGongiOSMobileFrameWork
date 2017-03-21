//
//  PassValueViewController4.m
//  DaGongiOSMobileFrameWork
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 DaGong. All rights reserved.
//

#import "PassValueViewController4.h"
#import "CommonConfig.h"
#import "GwbButton.h"
#import "PassValueViewController.h"

@implementation PassValueViewController4

-(void)viewDidLoad{
   [self setUpUI];
   [self setUpButton];
}

-(void)setUpButton{
    GwbButton *btn=[GwbButton buttonWithRoundType:UIButtonTypeCustom frame:CGRectMake(50, 500, 300, 50) title:@"model回退" image:[UIImage imageNamed: @""] handler:^(UIButton *sender){
        [self dismissViewControllerAnimated:YES completion:nil];
// 如果会跳到一个分支UINavigationController可以使用如下这种方式，暂时还没碰到这样的使用场景
// PassValueViewController * vcn5 = [[PassValueViewController alloc] init]; // 这个是 subNavigationController 的 root vc。
// vcn5.passValue1 = @"value"; // 传参
// UINavigationController* subNavigationController = [[UINavigationController alloc] initWithRootViewController:vcn5];
// subNavigationController.navigationBarHidden = YES;
// [self.navigationController presentViewController:subNavigationController animated:YES completion:nil]; // 这里 present        的是 subNavigationControl
    }];
    btn.backgroundColor=[UIColor blueColor];
    [self.view addSubview:btn];
}

-(void) setUpUI{
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(50.0,200.0,200.0,50.0)];
    label1.text =  self.passValue4;
    //行数
    label1.numberOfLines=0;
    label1.backgroundColor=[UIColor clearColor]; //可以去掉背景色
    //设置高亮
    label1.highlighted = YES;
    label1.highlightedTextColor = [UIColor orangeColor];
    //设置阴影
    label1.shadowColor  = [UIColor redColor];
    label1.shadowOffset = CGSizeMake(1.0,1.0);
    //设置是否能与用户进行交互
    label1.userInteractionEnabled = YES;
    //设置label中的文字是否可变，默认值是YES
    label1.enabled = NO;
    //设置字体
    label1.font = [UIFont fontWithName:@"Helvetica" size:16];
    //设置居中
    [label1 sizeToFit];
    label1.center = CGPointMake(SCREEN_WIDTH/2,SCREEN_HEIGHT/2);
    [self.view addSubview:label1];
}
@end
